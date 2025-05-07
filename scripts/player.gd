extends CharacterBody2D
class_name Player

@export var gravity = 400
@export var speed = 125
@export var jump_force = 200

@onready var animated_sprite = $AnimatedSprite2D

var active = true

func _physics_process(delta: float) -> void:
	# Only apply gravity if the player is not on the floor
	if is_on_floor() == false:
		velocity.y += gravity * delta
		if velocity.y > 500:
			velocity.y = 500

	var direction = 0
	
	if active == true:
		if Input.is_action_just_pressed("jump") && is_on_floor():
			# Jump if the player presses the jump button and is on the floor
			jump(jump_force)
		
		direction = Input.get_axis("move_left", "move_right")

	if direction != 0:
		# Move the player left or right		
		animated_sprite.flip_h = direction < 0	

	# Move the player left or right
	velocity.x = direction * speed

	move_and_slide()

	update_animation(direction)

func update_animation(direction) -> void:
	# Update the animation based on the player's velocity
	if is_on_floor():
		if direction != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
	else:
		if velocity.y < 0:
			animated_sprite.play("jump")
		else:
			animated_sprite.play("fall")

func jump(force: float) -> void:
	# Play the jump sound
	AudioPlayer.play_sfx("jump")
	# Jump with a specified force
	velocity.y = -force