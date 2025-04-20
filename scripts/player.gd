extends CharacterBody2D

@export var gravity = 400
@export var speed = 125
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Only apply gravity if the player is not on the floor
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500

	if Input.is_action_just_pressed("jump"):
		# Jump if the player presses the jump button and is on the floor
		velocity.y = -jump_force
	
	var direction = Input.get_axis("move_left", "move_right")
	# Move the player left or right
	velocity.x = direction * speed

	move_and_slide()