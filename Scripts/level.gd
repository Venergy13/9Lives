extends Node2D

@export var patterns : Array[PackedScene]
var amnt = 3
var rng = RandomNumberGenerator.new()
var x_offset = 320
var instance

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in amnt:
		spawnPattern(n*x_offset)


func spawnPattern(n):
	rng.randomize()
	var num = rng.randi_range(0,patterns.size()-1)
	if n == 0:
		instance = patterns[0].instantiate()
	else:
		instance = patterns[num].instantiate()
	instance.position.x = n
	add_child(instance)
