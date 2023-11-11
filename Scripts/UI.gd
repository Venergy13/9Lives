extends Control

var player

@onready var yarn_label = $HUD/VBoxContainer/HBoxContainer2/Label
@onready var lives_label = $HUD/VBoxContainer/HBoxContainer/Label
@onready var game_over = $GameOverScreen
@onready var game_over_lives = $GameOverScreen/VBoxContainer/Label2

func _ready():
	player = get_node("../Player")
	player.yarn_collected.connect(update_yarn)
	player.player_died.connect(on_player_death)
	game_over.visible = false


func update_yarn(yarn):
	yarn_label.text = str(yarn)
	

func on_player_death():
	await get_tree().create_timer(3).timeout
	lives_label.text = str(player.lives)
	game_over_lives.text = "You have "+ str(player.lives) + " lives left"
	game_over.visible = true
	


func _on_continue_button_pressed():
	game_over.visible = false
