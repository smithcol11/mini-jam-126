extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	$Hud.hide()
	pass # Replace with function body.

func _physics_process(delta):
	pass

func _on_start_menu_start_game():
	$Hud.show()
	$StartMenu.queue_free()
	$Music.play()

func _on_music_finished():
	print("Changing Song")
	$Music2.play()

func _on_music_2_finished():
	print("Changing Song")
	$Music.play()

func _on_hud_season_change(season):
	$Enviornment.change_season(season)
	pass # Replace with function body.
