class_name Underworld

extends Node2D

signal switch_to_overworld
signal restart

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player._init_underworld()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_killzone_player_dead():
	restart.emit()
	# Engine.time_scale = 1


func _on_button_button_pressed():
	print('emitting switch')
	switch_to_overworld.emit()
	pass # Replace with function body.
