extends Node2D

@export var next_level: PackedScene = null

@onready var deathZone = $DeathZone
@onready var start = $Start
@onready var exit = $Exit
@onready var saw = $Traps/Saw
@onready var spikeBall = $Traps/SpikeBall

var player = null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")

	# Check if the player is null
	if player != null:
		player.global_position = start.get_spawn_position()

	# Connect the death zone to the player
	deathZone.body_entered.connect(_on_deathZone_body_entered)

	# Connect the traps to the player
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)

	# Connect the exit to the player
	exit.body_entered.connect(_on_exit_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_deathZone_body_entered(_body: Node) -> void:
	reset_player()

func _on_trap_touched_player() -> void:
	reset_player()


func reset_player() -> void:
	# Reset the player's position to the start position
	player.velocity = Vector2.ZERO
	player.global_position = start.get_spawn_position()

func _on_exit_body_entered(body: Node) -> void:
	# Check if the body is a Player
	# If the player is in the exit area, play the exit animation
	if body is Player:
		if next_level != null:
			exit.animate()
			player.active = false
			await get_tree().create_timer(1.5).timeout
			get_tree().change_scene_to_packed(next_level)
