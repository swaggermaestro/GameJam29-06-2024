extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("You died!")
	body.get_node("CollisionShape2D").queue_free()
	Engine.time_scale = 0.4
	timer.start()
	


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://scenes/underworld.tscn")
	# get_tree().reload_current_scene()
	Engine.time_scale = 1
	pass # Replace with function body.
