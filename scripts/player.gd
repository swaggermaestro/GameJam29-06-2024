extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
signal action_pressed
@onready var animated_sprite = $AnimatedSprite2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var idle_path = "idle"
var run_path = "run"
var jump_path = "jump"

func _init_overworld():
	idle_path = "idle"
	run_path = "run"
	jump_path = "jump"

func _init_underworld():
	idle_path = "idle_underworld"
	run_path = "run_underworld"
	jump_path = "jump_underworld"
	
	

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Handle jump.
	if Input.is_action_just_pressed("interact"):
		action_pressed.emit()

	# Get the input direction: -1, 0, 1
	var direction = Input.get_axis("move_left", "move_right")
	
	# Flips sprite
	if direction > 0:
		animated_sprite.flip_h = false
	elif direction < 0:
		animated_sprite.flip_h = true
	
	# Play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play(idle_path)
		else:
			animated_sprite.play(run_path)
	else:
		animated_sprite.play(jump_path)
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
