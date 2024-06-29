extends Node2D

var overworldPacked = preload("res://scenes/overworld.tscn")
var underworldPacked = preload("res://scenes/underworld.tscn")
var underworld: Underworld
var overworld: Overworld

const TIME_PER_COIN = 5

var underworld_coins: int = 0

func init_underworld():
	underworld = underworldPacked.instantiate()
	underworld.switch_to_overworld.connect(_switch_to_overworld)
	underworld.restart.connect(restart_underworld)
	
func init_overworld():
	overworld = overworldPacked.instantiate()
	overworld.switch_to_underworld.connect(_switch_to_underworld)
	overworld.restart.connect(restart_overworld)

func restart_underworld():
	remove_child(underworld)
	underworld.queue_free()
	init_underworld()
	add_child(underworld)

func restart_overworld():
	remove_child(overworld)
	overworld.queue_free()
	init_overworld()
	add_child(overworld)


# Called when the node enters the scene tree for the first time.
func _ready():
	init_overworld()
	init_underworld()
	
	add_child(overworld)
	pass # Replace with function body.

func _switch_to_overworld(coins: int):
	underworld_coins = coins
	remove_child(underworld)
	init_overworld()
	add_child(overworld)
	overworld.add_time(underworld_coins * TIME_PER_COIN)
	pass
	
func _switch_to_underworld():
	remove_child(overworld)
	add_child(underworld)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
