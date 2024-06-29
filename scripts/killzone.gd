extends Area2D

@onready var timer = $Timer
signal player_dead

func _on_body_entered(body):
	print("You died!")
	body.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = 0.4
	timer.start()

func _on_timer_timeout():
	player_dead.emit()

	pass # Replace with function body.
