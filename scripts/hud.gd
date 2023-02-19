extends Control

@export var secondsPerDay : float = 1 #wasn't working for Timer.Start(secondsPerDay)? changed to $Timer.start(1) 
@export var usedFoodPerDay : float = 1

var icon_winter = preload("res://icons/icons8-snowflake-50.png")
var icon_spring = preload("res://icons/icons8-spring-50.png")
var icon_summer = preload("res://icons/icons8-summer-50.png")
var icon_fall = preload("res://icons/icons8-autumn-50.png")

var foodBar : Node

var season = 0
var year = 0
var day = 0

var icons = [icon_winter, icon_spring, icon_summer, icon_fall]

signal season_change
signal year_change
signal day_change
signal game_over

# Called when the node enters the scene tree for the first time.
func _ready():
	foodBar = $FoodSupplyBar
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	day += 1
	$ProgressBar.value = day
	foodBar.deplete_food(usedFoodPerDay)
	emit_signal("day_change", day)

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
		
		day = 0
		$ProgressBar.value = day
		emit_signal("season_change", season)

func _on_start_menu_start_game():
	#Setup time:
	day = 1
	season = 1
	year = 1
	#Emit signal changes:
	emit_signal("day_change", day)
	emit_signal("season_change", season)
	emit_signal("year_change", year)
	
	$Timer.start(secondsPerDay)

