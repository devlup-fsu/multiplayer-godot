extends Control


func _on_host_server_button_pressed():
	Multiplayer.start_server()


func _on_join_server_button_pressed():
	Multiplayer.start_client()
