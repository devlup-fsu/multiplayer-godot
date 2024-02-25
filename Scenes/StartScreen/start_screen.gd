extends Control


func _ready():
	Multiplayer.game_started.connect(_on_game_started)


func _on_host_server_button_pressed():
	Multiplayer.start_server()


func _on_join_server_button_pressed():
	Multiplayer.start_client()


func _on_game_started():
	hide()
