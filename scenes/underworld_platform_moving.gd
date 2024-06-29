extends AnimatableBody2D
@onready var ray_cast_right = $ray_cast_right
@onready var ray_cast_left = $ray_cast_left

const SPEED = 120
var direction = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ray_cast_right.is_colliding():
		direction = -1
	if ray_cast_left.is_colliding():
		direction = 1
		
	position.x += direction * SPEED * delta
	
