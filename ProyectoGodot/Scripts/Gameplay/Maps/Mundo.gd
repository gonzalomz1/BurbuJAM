extends Node2D

const LABERINTO1 = preload("res://Scenes/World/laberinto1.tscn")
const LABERINTO2 = preload("res://Scenes/World/laberinto2.tscn") 
const LABERINTO3 = preload("res://Scenes/World/laberinto3.tscn")


func laberinto_1():
	print("se llamo al laberinto1")
	var instancia = LABERINTO1.instantiate()
	add_child(instancia)

func laberinto_2():
	print("se llamo al laberinto1")
	var instancia = LABERINTO2.instantiate()
	add_child(instancia)

func laberinto_3():
	print("se llamo al laberinto1")
	var instancia = LABERINTO3.instantiate()
	add_child(instancia)
