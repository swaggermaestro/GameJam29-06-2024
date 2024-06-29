extends Timer

@onready var timer_label: Label = $"../HUD/TimerLabel"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer_label.text = "Time:" + str(int(time_left))
	pass
