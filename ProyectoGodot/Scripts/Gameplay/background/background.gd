extends Node2D

var tween

func cambiar_back(frame):
	cambiarFrame(frame)

func cambiarFrame(frame: int) -> void:
	tween = create_tween()
	match frame:
		0:
			tween.tween_property($Sprite2D, "frame", 0, 3)
		1:
			tween.tween_property($Sprite2D, "frame", 1, 3)
		2:
			tween.tween_property($Sprite2D, "frame", 2, 3)
		3:
			tween.tween_property($Sprite2D, "frame", 3, 3)
		4:
			tween.tween_property($Sprite2D, "frame", 4, 3)
	tween.play()
