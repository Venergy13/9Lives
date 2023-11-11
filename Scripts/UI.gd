extends Control

var player

@onready var yarn_label = $CanvasLayer/VBoxContainer/HBoxContainer2/Label
@onready var lives_label = $CanvasLayer/VBoxContainer/HBoxContainer/Label

func _ready():
	player = get_node("../Player")
	player.yarn_collected.connect(update_yarn)


func update_yarn(yarn):
	yarn_label.text = str(yarn)
	
