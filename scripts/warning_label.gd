extends Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
	
	
func show_warning(seconds):
	$WarningTimer.start(seconds)
	visible = true


func _on_warning_timer_timeout():
	visible = false
	$WarningTimer.stop()
