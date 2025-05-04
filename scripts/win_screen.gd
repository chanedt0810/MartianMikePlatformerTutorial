extends Control

@onready var button = $Button

func _ready() -> void:
    # Connect the button pressed signal to the _on_button_pressed function
    button.pressed.connect(_on_button_pressed)

func _on_button_pressed() -> void:
    get_tree().change_scene_to_file("res://scenes/level.tscn")