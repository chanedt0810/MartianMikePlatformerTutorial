extends Control

@onready var start_button = $StartButton
@onready var quit_button = $QuitButton

func _ready() -> void:
	# Connect the button pressed signals to the respective functions
	start_button.pressed.connect(_on_start_button_pressed)
	quit_button.pressed.connect(_on_quit_button_pressed)

func _on_start_button_pressed() -> void:
	# Change the scene to the level scene
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _on_quit_button_pressed() -> void:
	# Quit the game
	get_tree().quit()
