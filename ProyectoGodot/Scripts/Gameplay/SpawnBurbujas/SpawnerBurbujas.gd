extends Node2D

class_name SpawnerBurbujas
const ESCENA_BURBUJA = "res://Scenes/Game/burbuja.tscn"
const ESCENA_PINCHO_QUE_CAE = "res://Scenes/pinchoQueCae.tscn"
@onready var SpawnBurbujas = [
	$SpawnBurbujas/Posicion1,
	$SpawnBurbujas/Posicion2,
	$SpawnBurbujas/Posicion3,
	$SpawnBurbujas/Posicion4,
	$SpawnBurbujas/Posicion5,
	$SpawnBurbujas/Posicion6,
	$SpawnBurbujas/Posicion7,
	$SpawnBurbujas/Posicion8,
	$SpawnBurbujas/Posicion9
]

@onready var SpawnPinchos = [
	$SpawnPinchos/Posicion1,
	$SpawnPinchos/Posicion2,
	$SpawnPinchos/Posicion3,
	$SpawnPinchos/Posicion4,
	$SpawnPinchos/Posicion5,
	$SpawnPinchos/Posicion6,
	$SpawnPinchos/Posicion7,
	$SpawnPinchos/Posicion8,
	$SpawnPinchos/Posicion9,
	$SpawnPinchos/Posicion10,
	$SpawnPinchos/Posicion11,
	$SpawnPinchos/Posicion12,
	$SpawnPinchos/Posicion13,
	$SpawnPinchos/Posicion14,
	$SpawnPinchos/Posicion15,
	$SpawnPinchos/Posicion16,
	$SpawnPinchos/Posicion17,
	$SpawnPinchos/Posicion18,
	$SpawnPinchos/Posicion19
]

func comenzarAFuncionarBurbujas() -> void:
	$TimerBurbujas.start(0)

func comenzarAFuncionarPinchos() -> void:
	$TimerPinchos.start(0)

func _on_timer_timeout():
	var posicion_aleatoria = obtenerNodoAleatorioDeBurbujas()
	spawnearBurbuja(posicion_aleatoria)

func _on_timer_pinchos_timeout():
	var posicion_aleatoria = obtenerNodoAleatorioDePinchos()
	spawnearPincho(posicion_aleatoria)

func obtenerNodoAleatorioDeBurbujas() -> Node:
	if SpawnBurbujas.size() > 0:  # Asegúrate de que la lista no esté vacía
		var index_random = randi() % SpawnBurbujas.size()
		return SpawnBurbujas[index_random]
	return null  # Retorna null si la lista está vacía

func obtenerNodoAleatorioDePinchos() -> Node:
	if SpawnPinchos.size() > 0:  # Asegúrate de que la lista no esté vacía
		var index_random = randi() % SpawnPinchos.size()
		return SpawnPinchos[index_random]
	return null  # Retorna null si la lista está vacía

func spawnearBurbuja(nodoElegido: Node) -> void:
	var burbuja = preload(ESCENA_BURBUJA).instantiate()
	nodoElegido.add_child(burbuja)

func spawnearPincho(nodoElegido: Node) -> void:
	var pincho = preload(ESCENA_PINCHO_QUE_CAE).instantiate()
	nodoElegido.add_child(pincho)


func pinchos():
	comenzarAFuncionarPinchos()
