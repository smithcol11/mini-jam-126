extends Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_day_change(day):
	$ProgressBar.value = $ProgressBar.value - 1
	text = str($ProgressBar.value)
	if ($ProgressBar.value == 0):
		get_parent().emit_signal("game_over")
	
func add_food(foodAmount):
	$ProgressBar.value = $ProgressBar.value + foodAmount
	text = str($ProgressBar.value)
