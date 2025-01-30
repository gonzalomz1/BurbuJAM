extends Node2D


func _on_destructor_de_laberinto_area_entered(area: Area2D) -> void:
	queue_free()
