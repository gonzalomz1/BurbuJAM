extends Node2D

const LABERINTO1 = preload("res://Scenes/World/laberinto1.tscn")
const LABERINTO2 = preload("res://Scenes/World/laberinto2.tscn") 
const LABERINTO3 = preload("res://Scenes/World/laberinto3.tscn")

var scroll_on: bool = false
var laberintos:Array = []

func laberinto_1():
	print("se llamo al laberinto1")
	var instancia = LABERINTO1.instantiate()
	add_child(instancia)
	laberintos.append(instancia)
	scroll_on = true

func laberinto_2():
	print("se llamo al laberinto1")
	var instancia = LABERINTO2.instantiate()
	add_child(instancia)
	laberintos.append(instancia)

func laberinto_3():
	print("se llamo al laberinto1")
	var instancia = LABERINTO3.instantiate()
	add_child(instancia)
	laberintos.append(instancia)

func _physics_process(delta: float) -> void:
	if scroll_on:
		for laberinto in laberintos:
			laberinto.position.y += EventManager.velocidad_scroll_descenso
