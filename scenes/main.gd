extends Node2D

var overworldPacked = preload("res://scenes/overworld.tscn")
var underworldPacked = preload("res://scenes/underworld.tscn")
var underworld: Underworld
var overworld: Overworld

func init_underworld():
	underworld = underworldPacked.instantiate()
	underworld.switch_to_overworld.connect(_switch_to_overworld)
	
func init_overworld():
	overworld = overworldPacked.instantiate()
	overworld.switch_to_underworld.connect(_switch_to_underworld)

# Called when the node enters the scene tree for the first time.
func _ready():
	init_overworld()
	init_underworld()
	
	add_child(overworld)
	pass # Replace with function body.

func _switch_to_overworld():
	remove_child(underworld)
	init_overworld()
	add_child(overworld)
	pass
	
func _switch_to_underworld():
	remove_child(overworld)
	add_child(underworld)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
