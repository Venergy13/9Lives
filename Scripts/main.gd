extends Node2D


@onready var player = $Player
@onready var level = $Level
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func restart():
	player.respawn()
	level.restart()
	
