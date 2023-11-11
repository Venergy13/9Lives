extends Node2D

var sound = preload("res://Assets/Sounds/SFX/cartoon-little-cat-meow-91.mp3")

func _on_area_2d_body_entered(body):
	if (body is Player):
		AudioManager.play(body, sound)
		body.gain_yarn()
		queue_free()
