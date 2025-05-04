extends Node2D

@onready var area_2d = $Area2D

signal touched_player

func _ready() -> void:
    # Called when the node enters the scene tree for the first time.
    area_2d.body_entered.connect(_on_area_2d_body_entered)

func _on_area_2d_body_entered(body: Node) -> void:
    # Check if the body is a Player
    if body is Player:
        touched_player.emit()