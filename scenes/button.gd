extends AnimatableBody2D


@export var body_entered = false
@onready var animated_sprite_2d = $AnimatedSprite2D



func _on_button_area_body_entered(body):
	body_entered = true
	var current_button_name = body.name
	print("BUTTON ENTERED: %s" % self)


func _on_button_area_body_exited(body):
	body_entered = false
	print("BUTTON EXITED")


func _on_player_action_pressed():
	if (body_entered):
		animated_sprite_2d.play("default")
		print("BUTTON PRESSED")
