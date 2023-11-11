extends Node2D
class_name Pattern

@onready var level = $"../"
var speed = 100
var player

func _ready():
	player = get_node("../../Player")
	player.player_died.connect(end)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= speed*delta
	if position.x < -320:
		if (!level.level_ended):
			level.spawnPattern(position.x+(level.amnt*level.x_offset))
		queue_free()

func end():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "speed", 0, 2)
