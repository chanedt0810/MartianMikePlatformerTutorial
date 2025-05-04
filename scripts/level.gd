extends Node2D

@onready var deathZone = $DeathZone
@onready var startPosition = $StartPosition
@onready var saw = $Traps/Saw
@onready var spikeBall = $Traps/SpikeBall
@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deathZone.body_entered.connect(_on_deathZone_body_entered)
	var traps = get_tree().get_nodes_in_group("traps")
	for trap in traps:
		trap.touched_player.connect(_on_trap_touched_player)

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
	player.global_position = startPosition.global_position
