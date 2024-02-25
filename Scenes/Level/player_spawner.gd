extends MultiplayerSpawner

var player_scene: PackedScene = load("res://Entities/Player/player.tscn")


func _ready():
	spawn_function = spawn_func


func spawn_func(id: int) -> Node:
	var player = player_scene.instantiate()
	player.id = id
	player.name = str(id)
	return player
