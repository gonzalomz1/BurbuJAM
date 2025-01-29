extends Node

@onready var gameplay = $Gameplay


func _ready() -> void:
	playGameplay()

func playGameplay() -> void:
	gameplay.play()
