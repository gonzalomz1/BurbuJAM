extends Node

signal cambiarSeccion(seccion:String)

## SCORE
var score:int
var tiempo_transcurrido:int

## Variables para los instanceos
var laberinto1_llamado: bool  =false
var laberinto2_llamado: bool = false
var laberinto3_llamado: bool = false
var pincho_llamado: bool = false

## InputManager
enum GameState {GAMEPLAY, MENU}
var current_state = GameState.MENU
var input_disabled = true

## IMPORTANTE:
# Si se utilizan nodos de Control
# Debera agregarse:
# if InputManager.input_disabled
# Esta linea de if asegura que se desactivan los inputs globalmente

func _ready():
	comenzarAnimacionMenuInicio()

func _input(event: InputEvent) -> void:
	handle_input(event)

func _unhandled_input(event: InputEvent) -> void:
	handle_input(event)

func handle_input(event) -> void:
	if input_disabled:
		return
	if current_state == GameState.GAMEPLAY:
		var player = get_player()
		if player:
			player.handle_input(event)  # Pasa el input al jugador
	elif current_state == GameState.MENU:
		var menu = get_menu_node()
		if menu:
			menu.handle_input(event) # Pasa el input al nodo de MENU

func handle_mouse_input():
	pass

func comenzarAnimacionMenuInicio() -> void:
	var jugador = get_player()
	var menu = get_menu_node()
	var ui = get_ui_node()
	ui.desabilitar()
	jugador.desabilitar()
	menu.animacionComienzoDelJuego()

func _on_menu_comenzar_juego():
	comenzarGameplay()
	current_state = GameState.GAMEPLAY

func comenzarGameplay() -> void:
	var jugador = get_player()
	var menu = get_menu_node()
	var ui = get_ui_node()
	var spawnerBurbujas = get_spawner_node()
	ui.comienzaGameplay()
	jugador.habilitar()

	jugador.position = Vector2(628,655)
	menu.hide()
	spawnerBurbujas.comenzarAFuncionarBurbujas()
	EventManager.resetearVariables()

func _on_menu_termino_animacion_inicio_juego():
	input_disabled = false

func _on_limites_del_juego_game_over():
	mostrarGameOver()

func _on_ui_se_quedo_sin_aire():
	mostrarGameOver()

func mostrarGameOver() -> void:
	var ui = get_ui_node()
	var menu = get_menu_node()
	ui.desabilitar()
	menu.animacionGameOver()
	print("se llamo a al funcion animacionGameOver en juego")

func _physics_process(_delta):
	if EventManager.tiempo >= 5:
		if !laberinto1_llamado:
			laberinto1()
			cambiarFondo(1)
			emit_signal("cambiarSeccion", "B")
			laberinto1_llamado = true
	if EventManager.tiempo >= 25:
		if !laberinto2_llamado:
			laberinto2()
			cambiarFondo(2)
			emit_signal("cambiarSeccion", "C")
			laberinto2_llamado = true
	if EventManager.tiempo >= 45:
		if !laberinto3_llamado:
			laberinto3()
			cambiarFondo(3)
			emit_signal("cambiarSeccion", "D")
			laberinto3_llamado = true
	if EventManager.tiempo >= 65:
		if !pincho_llamado:
			pincho()
			cambiarFondo(4)
			emit_signal("cambiarSeccion", "E")
			pincho_llamado = true

func laberinto1():
	var nodo = get_laberintos_node()
	nodo.laberinto_1()

func laberinto2():
	var nodo = get_laberintos_node()
	nodo.laberinto_2()

func laberinto3():
	var nodo = get_laberintos_node()
	nodo.laberinto_3()

func pincho():
	var nodo = get_spawner_node()
	nodo.pinchos()

func cambiarFondo(frame:int) -> void:
	var nodo = get_background_node()
	nodo.cambiar_back(frame)

func get_player() -> CharacterBody2D:
	return get_node("Jugador")

func get_menu_node() -> Control:
	return get_node("Menu") 

func get_ui_node() -> CanvasLayer:
	return get_node("UI")

func get_spawner_node() -> Node2D:
	return get_node("SpawnerBurbujas")

func get_laberintos_node() -> CanvasLayer:
	return get_node("SpawnerLaberintos")

func get_background_node() -> Node2D:
	return get_node("Background")
