class_name Underworld

extends Node2D

signal switch_to_overworld(coins: int)
signal restart

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_killzone_player_dead():
	restart.emit()
	# Engine.time_scale = 1


func _on_button_button_pressed():
	print('emitting switch')
	var coins = $GameManager.score 
	switch_to_overworld.emit(coins)
	pass # Replace with function body.
