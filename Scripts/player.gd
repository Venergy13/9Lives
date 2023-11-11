extends CharacterBody2D
class_name Player

signal player_died
signal yarn_collected(yarn_amount)

const SPEED = 400.0
const JUMP_VELOCITY = -300.0

var alive = true
var yarn = 0
var lives = 9
@onready var sprite = $AnimatedSprite2D
@export var starting_position : Vector2

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if (!alive):
		return
	
	if (position.y > 320):
		die()
	
	if Input.is_action_just_pressed("ui_down"):
		die()
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		sprite.play("jump")
		
	move_and_slide()


func _on_animated_sprite_2d_animation_finished():
	if sprite.animation == "jump":
		sprite.play("run")
		
func die():
	alive = false
	lives -=1
	emit_signal("player_died")
	sprite.play("die")
	
func gain_yarn():
	yarn += 1
	emit_signal("yarn_collected", yarn)

func respawn():
	sprite.play("run")
	position = starting_position
	alive = true


func _on_area_2d_body_entered(body):
	if (body.is_in_group("enemy")):
		die()
