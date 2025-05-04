extends Area2D

@export var jump_force = 300

@onready var animated_sprite = $AnimatedSprite2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.connect("body_entered", _on_jump_pad_body_entered)

func _on_jump_pad_body_entered(body: Node) -> void:
	if body is Player:
		animated_sprite.play("jump")
		body.jump(jump_force)
