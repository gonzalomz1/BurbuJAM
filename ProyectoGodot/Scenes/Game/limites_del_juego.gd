extends Node2D

signal GameOver

func _on_destruye_jugador_body_entered(body: Node2D) -> void:
	print("se envio senial game over")
	emit_signal("GameOver")


func _on_desabilitador_muro_sur_area_entered(area: Area2D) -> void:
	print("Se desabilito el muro sur")
	$Sur/ColisionSur.disabled = true


func _on_desabilitador_muro_sur_area_exited(area: Area2D) -> void:
	$Sur/ColisionSur.disabled = false
