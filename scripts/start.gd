extends StaticBody2D

@onready var spawn_position = $SpawnPosition

func get_spawn_position() -> Vector2:
    # Return the position of the spawn point
    return spawn_position.global_position
