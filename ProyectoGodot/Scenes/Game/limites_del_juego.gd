extends Node2D

signal GameOver


func _on_detector_de_obstaculo_area_entered(_area):
	$Sur/ColisionSur.disabled = true

func _on_detector_de_obstaculo_area_exited(_area):
	$Sur/ColisionSur.disabled = false

func _on_destruye_jugador_body_entered(body: Node2D) -> void:
	emit_signal("GameOver")
