extends Node


func _ready():
	Multiplayer.game_started.connect(_on_game_started)


func _on_game_started():
	$StartScreen.queue_free()
	
	if multiplayer.is_server():
		change_level.call_deferred(load("res://Scenes/Level/level.tscn"))


func change_level(scene: PackedScene):
	# Remove old level if any.
	var level = $Level
	for c in level.get_children():
		level.remove_child(c)
		c.queue_free()
	# Add new level.
	level.add_child(scene.instantiate())
