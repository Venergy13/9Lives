extends Node2D

var scroll_x_mid = 0 
@export var scroll_speed_mid = 0.2
var scroll_x_front = 0 
@export var scroll_speed_front = 0.5

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/Mid.set_motion_offset(Vector2(scroll_x_mid,0))
	scroll_x_mid -= scroll_speed_mid
	$ParallaxBackground/Front.set_motion_offset(Vector2(scroll_x_front,0))
	scroll_x_front -= scroll_speed_front
