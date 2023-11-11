extends CharacterBody2D
class_name Wolf

var attack_sound = preload("res://Assets/Sounds/SFX/Monster Bite   Sound Effect.mp3")
var warning_sound = preload("res://Assets/Sounds/SFX/beast-snarling-82801.mp3")

const SPEED = 100.0
# Called when the node enters the scene tree for the first time.
func _ready():
	AudioManager.play(self,warning_sound,5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity.x = -SPEED
	move_and_slide()
