extends Node2D

var scroll_x_mid = 0 
@export var scroll_speed_mid = 0.2
var scroll_x_front = 0 
@export var scroll_speed_front = 0.5
var player

func _ready():
	player = get_node("../../Player")
	player.player_died.connect(end)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/Mid.set_motion_offset(Vector2(scroll_x_mid,0))
	scroll_x_mid -= scroll_speed_mid
	$ParallaxBackground/Front.set_motion_offset(Vector2(scroll_x_front,0))
	scroll_x_front -= scroll_speed_mid
	
func end():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "scroll_speed_mid", 0, 2)
	tween.tween_property(self, "scroll_speed_front", 0, 2)
