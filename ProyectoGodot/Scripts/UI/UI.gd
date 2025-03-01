extends CanvasLayer

signal seQuedoSinAire

var juego_termino:bool = false

# Cada frame
func _physics_process(delta):
	if juego_termino:
		return
	if EventManager.cronometro_activo:
		if EventManager.aire > 0.0:
			EventManager.aire -= EventManager.velocidad_descenso_aire * delta  # Reducimos el aire gradualmente
			actualizar_barra_aire()
		else:
			fin_del_juego() # Si el aire se termina, el juego finaliza
		
		EventManager.tiempo+= delta # Incrementar el cronometro
		actualizar_tiempo()
		
		
		ajustar_dificultad() # Ajustar la velocidad del descenso del aire segun el tiempo transcurrido
		
		actualizarScore()

## ACTUALIZAR INTERFAZ

func actualizar_barra_aire()-> void:
	$Aire.value = EventManager.aire / EventManager.aire_maximo * 100 # (valor en porcentaje)

func actualizar_tiempo()-> void:
	$Tiempo.text = "Tiempo: " + str(floor(EventManager.tiempo)) + " s" # Tiempo redondeado

## SISTEMAS DEL JUEGO

func recoger_burbuja(cantidad:float) -> void:
	EventManager.aire = min(EventManager.aire + cantidad, EventManager.aire_maximo) # No puede superar el maximo 

func ajustar_dificultad() -> void:
	# Incrementa la dificultad de descenso de aire segun el tiempo transcurrido
	if EventManager.tiempo > 10:
		EventManager.velocidad_descenso_aire = 1.5
	if EventManager.tiempo > 30:
		EventManager.velocidad_descenso_aire = 2.5
	if EventManager.tiempo > 50:
		EventManager.velocidad_descenso_aire = 3

func fin_del_juego()-> void:
	juego_termino = true
	emit_signal("seQuedoSinAire")

func sumarScore() -> void:
	print("sumando score")
	EventManager.score += 25

func actualizarScore() -> void:
	$Score.text = "Score: " + str(EventManager.score) # Score actual del jugador segun cuantas monedas agarra

## CONTROL DE VISIBILIDAD

func desabilitar() -> void:
	hide()

func habilitar() -> void:
	show()

func comienzaGameplay() -> void:
	habilitar()
	EventManager.cronometro_activo = true
