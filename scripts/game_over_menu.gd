extends Control

var is_paused = false : set = set_is_paused, get = get_is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	
func get_is_paused() -> bool:
	return is_paused

func _on_exit_button_pressed():
	get_tree().quit();

func _on_hud_game_over():
	set_is_paused(true)
