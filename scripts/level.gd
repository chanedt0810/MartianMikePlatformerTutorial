extends Node2D

@onready var deathZone = $DeathZone
@onready var startPosition = $StartPosition

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	deathZone.connect("body_entered", _on_deathZone_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
	elif Input.is_action_just_pressed("reset"):
		get_tree().reload_current_scene()

func _on_deathZone_body_entered(body: Node) -> void:
	body.velocity = Vector2.ZERO
	body.global_position = startPosition.global_position
