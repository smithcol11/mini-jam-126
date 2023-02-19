extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_hud_season_change(season):
	if (season == 1):
		text = "Winter"
	elif (season == 2):
		text = "Spring"
	elif (season == 3):
		text = "Summer"
	elif (season == 4):
		text = "Fall"
