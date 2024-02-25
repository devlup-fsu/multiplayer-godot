extends CharacterBody2D

const SPEED = 300.0

@export var id: int = 1:
	set(value):
		id = value
		$InputSynchronizer.set_multiplayer_authority(value)


func _ready():
	if id == multiplayer.get_unique_id():
		#$Camera2D.enabled = true
		pass


func _physics_process(_delta):
	if $InputSynchronizer.jumping:
		print("Jump")
		$InputSynchronizer.jumping = false

	var direction = $InputSynchronizer.direction
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)

	move_and_slide()
