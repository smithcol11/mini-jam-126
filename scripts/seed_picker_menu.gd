extends Control

var is_paused = false : set = set_is_paused, get = get_is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	
func get_is_paused() -> bool:
	return is_paused

func _on_resume_button_pressed():
	self.is_paused = false

#func _on_hud_year_change():
	#print("hud year changed")
	#set_is_paused(true)

func _on_hud_year_change(year):
	set_is_paused(true)
