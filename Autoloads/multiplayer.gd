extends Node

const PORT = 4433

signal game_started


func _ready():	
	# Automatically start the server in headless mode.
	if OS.has_feature("dedicated_server"):
		print("Automatically starting dedicated server.")
		start_server()


func start_server():
	var peer = ENetMultiplayerPeer.new()
	peer.create_server(PORT)
	
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer server.")
		return
	
	multiplayer.multiplayer_peer = peer
	game_started.emit()


func start_client(address = "localhost"):
	var peer = ENetMultiplayerPeer.new()
	peer.create_client(address, PORT)
	
	if peer.get_connection_status() == MultiplayerPeer.CONNECTION_DISCONNECTED:
		OS.alert("Failed to start multiplayer client.")
		return
	
	multiplayer.multiplayer_peer = peer
	game_started.emit()
