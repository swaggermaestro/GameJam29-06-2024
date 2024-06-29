extends Area2D

@onready var timer = $Timer
signal player_dead

func _on_body_entered(body):
	print("You died!")
	body.get_node("CollisionShape2D").queue_free()
	timer.start()

func _on_timer_timeout():
	player_dead.emit()
