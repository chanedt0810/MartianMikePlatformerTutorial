extends ParallaxBackground

@export var background_texture: CompressedTexture2D = preload("res://assets/textures/bg/Blue.png")
@export var scroll_speed: float = 15

@onready var sprite = $ParallaxLayer/Sprite2D

func _ready() -> void:
    # Set the texture of the sprite
    sprite.texture = background_texture

func _process(delta: float) -> void:
    # Update the position of the sprite based on the scroll speed
    sprite.region_rect.position += delta * Vector2(scroll_speed, scroll_speed)
    
    # Reset the position of the sprite if it goes beyond a certain point
    if sprite.region_rect.position >= Vector2(64, 64):
        sprite.region_rect.position = Vector2.ZERO
