extends Node

@onready var gameplay = $Gameplay
@onready var increase_speed = $increase_speed
@onready var sfx_increase_speed = $sfx_increase_speed

func _ready() -> void:
	playGameplay()

func playGameplay() -> void:
	gameplay.play()

func playOneShotIncreaseSpeed() -> void:
	increase_speed.play_one_shot()

func playOneShotSFXIncreaseSpeed() -> void:
	sfx_increase_speed.play_one_shot()
