extends MultiplayerSynchronizer

@export var jumping: bool = false
@export var direction: Vector2 = Vector2.ZERO

func _ready():
	# Only process on the local client.
	set_process(get_multiplayer_authority() == multiplayer.get_unique_id())


func _process(_delta):
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if Input.is_action_just_pressed("ui_accept"):
		jump.rpc()


@rpc("call_local")
func jump():
	jumping = true
