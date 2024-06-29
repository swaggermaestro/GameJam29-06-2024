class_name Overworld

extends Node2D
@onready var world_switch_timer = $WorldSwitchTimer

signal switch_to_underworld
signal restart

# Called when the node enters the scene tree for the first time.
func _ready():
	world_switch_timer.start()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_killzone_player_dead():
	get_tree().reload_current_scene()
	Engine.time_scale = 1
	pass # Replace with function body.


func _on_world_switch_timer_timeout():
	switch_to_underworld.emit()
	pass # Replace with function body.
