class_name Overworld

extends Node2D
@onready var world_switch_timer = $WorldSwitchTimer

signal switch_to_underworld
signal restart

# Called when the node enters the scene tree for the first time.
func _ready():
	world_switch_timer.start()
	pass # Replace with function body.
	

func add_time(coins: int):
	world_switch_timer.stop()
	world_switch_timer.wait_time = 10.0 + coins
	world_switch_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_killzone_player_dead():
	restart.emit()

func _on_world_switch_timer_timeout():
	switch_to_underworld.emit()
