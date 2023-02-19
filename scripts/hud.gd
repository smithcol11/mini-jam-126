extends Control

var icon_winter = preload("res://icons/icons8-snowflake-50.png")
var icon_spring = preload("res://icons/icons8-spring-50.png")
var icon_summer = preload("res://icons/icons8-summer-50.png")
var icon_fall = preload("res://icons/icons8-autumn-50.png")

var season = 1
var year = 0

var icons = [icon_winter, icon_spring, icon_summer, icon_fall]

signal season_change
signal year_change

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	$ProgressBar.value += 1
	pass # Replace with function body.

func _on_progress_bar_value_changed(value):
	if value >= 90:
		if season == 1:
			$ProgressBar/Button7.icon = icon_spring
			$ProgressBar/Button8.icon = icon_summer
		elif season == 2:
			$ProgressBar/Button7.icon = icon_summer
			$ProgressBar/Button8.icon = icon_fall
		elif season == 3:
			$ProgressBar/Button7.icon = icon_fall
			$ProgressBar/Button8.icon = icon_winter
		elif season == 4:
			$ProgressBar/Button7.icon = icon_winter
			$ProgressBar/Button8.icon = icon_spring
		season += 1
		if season == 5: 
			season = 1
			year += 1
			emit_signal("year_change", year)
		$ProgressBar.value = 0
		emit_signal("season_change", season)

func _on_start_menu_start_game():
	year = 1
	emit_signal("year_change", year)
	$Timer.start(.1)

