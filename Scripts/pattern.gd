extends Node2D

@onready var level = $"../"
var speed = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed*delta
	if position.x < -320:
		level.spawnPattern(position.x+(level.amnt*level.x_offset))
		queue_free()
