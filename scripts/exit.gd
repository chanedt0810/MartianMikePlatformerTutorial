extends Area2D

@onready var animated_sprite = $AnimatedSprite2D

func animate() -> void:
    # Play the exit animation
    animated_sprite.play("default")