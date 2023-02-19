extends Label

func _on_hud_season_change(season):
	if (season == 1):
		text = "Winter"
	elif (season == 2):
		text = "Spring"
	elif (season == 3):
		text = "Summer"
	elif (season == 4):
		text = "Fall"
		
func _on_hud_year_change(year):
	get_node("YearLabel").text = str("Year: ", year)
