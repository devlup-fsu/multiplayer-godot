extends Node2D


func _ready():
	if not multiplayer.is_server():
		return
	
	multiplayer.peer_connected.connect(add_player)
	multiplayer.peer_disconnected.connect(remove_player)
	
	for id in multiplayer.get_peers():
		add_player(id)
	
	if not OS.has_feature("dedicated_server"):
		add_player(1)


func _exit_tree():
	if not multiplayer.is_server():
		return
	
	multiplayer.peer_connected.disconnect(add_player)
	multiplayer.peer_disconnected.disconnect(remove_player)


func add_player(id: int):
	print("Connecting player ", id)
	$PlayerSpawner.spawn(id)


func remove_player(id: int):
	if not $Players.has_node(str(id)):
		return
	
	$Players.get_node(str(id)).queue_free()

