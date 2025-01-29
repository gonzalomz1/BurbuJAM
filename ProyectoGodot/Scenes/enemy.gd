extends CharacterBody2D

var speed = 25
var player_chase = false
var player = null



func _physics_process(_delta):
	if player_chase:
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("move")
		
	#else:
		#$AnimatedSprite2D.play("idle")


func _on_detection_area_body_entered(body):
	player = body
	player_chase = true


func _on_detection_area_body_exited(_body):
	player = null
	player_chase = false
