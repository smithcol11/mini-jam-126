extends Control

@export var secondsPerDay : float = 0.5
@export var timeEventSecondsPerDay : float = 0.1
@export var seasonSkipSecondsPerDay : float = 0.025

@export var usedFoodPerDay : float = 1

signal win_game

var icon_winter = preload("res://icons/icons8-snowflake-50.png")
var icon_spring = preload("res://icons/icons8-spring-50.png")
var icon_summer = preload("res://icons/icons8-summer-50.png")
var icon_fall = preload("res://icons/icons8-autumn-50.png")

var foodBar : Node

var season = 0
var year = 0
var day = 0

var win_condition = false

var num_of_gears = 0 # max 100
var num_of_bearings = 0 # max 50
var num_of_pistons = 0 # max 25
var num_of_springs = 0 # max 10
var num_of_fuel = 0 # max 50

var icons = [icon_winter, icon_spring, icon_summer, icon_fall]

signal season_change
signal year_change
signal day_change
signal game_over

var gearBtn
var bearingBtn
var pistonBtn
var springBtn
var fuelBtn

var potatoBtn
var tomatoBtn
var wheatBtn
var carrotBtn
var broccoliBtn

#array of all buttons
var buttons

var seedInventory

#part amount buttons
var gearAmount
var bearingAmount
var pistonAmount
var springAmount
var fuelAmount



var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	seedInventory = get_tree().get_root().find_child("SeedInventory", true, false)
	
	gearBtn = get_tree().get_root().find_child("gear", true, false)
	bearingBtn = get_tree().get_root().find_child("bearing", true, false)
	pistonBtn = get_tree().get_root().find_child("piston", true, false)
	springBtn = get_tree().get_root().find_child("spring", true, false)
	fuelBtn = get_tree().get_root().find_child("fuel", true, false)
	
	potatoBtn = get_tree().get_root().find_child("potato", true, false)
	tomatoBtn = get_tree().get_root().find_child("tomato", true, false)
	wheatBtn = get_tree().get_root().find_child("wheat", true, false)
	carrotBtn = get_tree().get_root().find_child("carrot", true, false)
	broccoliBtn = get_tree().get_root().find_child("broccoli", true, false)
	
	gearAmount = find_child("GearAmount", false, true)
	bearingAmount = find_child("BearingAmount", false, true)
	pistonAmount = find_child("PistonAmount", false, true)
	springAmount = find_child("SpringAmount", false, true)
	fuelAmount = find_child("FuelAmount", false, true)
	
	buttons = [gearBtn, bearingBtn, pistonBtn, springBtn, fuelBtn, potatoBtn, tomatoBtn, wheatBtn, carrotBtn, broccoliBtn]
	
	foodBar = $FoodSupplyBar

func add_health(amount):
	find_child("FoodSupplyBar", false, true).add_food(amount)
	
func add_gear(amount):
	num_of_gears += amount
	gearAmount.text = str(num_of_gears, "/100")
	check_win_condition()

func add_piston(amount):
	num_of_pistons += amount
	pistonAmount.text = str(num_of_pistons, "/50")
	check_win_condition()

func add_bearing(amount):
	num_of_bearings += amount
	bearingAmount.text = str(num_of_bearings, "/25")
	check_win_condition()
	
func add_fuel(amount):
	num_of_fuel += amount
	fuelAmount.text = str(num_of_fuel, "/50")
	check_win_condition()
	
func add_spring(amount):
	num_of_springs += amount
	springAmount.text = str(num_of_springs, "/10")
	check_win_condition()
	
func check_win_condition():
	if num_of_gears >= 100 && num_of_pistons >= 50 && num_of_bearings >= 25 && num_of_fuel >= 50 && num_of_springs >= 10:
		print("you win!")
		win_condition = true

func deselect_other_buttons(selectedBtnIndex):
	for index in 10:
		if index != selectedBtnIndex:
			buttons[index].set_block_signals(true)
			buttons[index].button_pressed = false
			buttons[index].set_block_signals(false)

func get_selected_button() -> Button:
	for index in 10:
		if buttons[index].button_pressed == true:
			return buttons[index]
	return null

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if win_condition:
		$Timer.stop()
		win_game.emit()

func _on_timer_timeout():
	day += 1
	$ProgressBar.value = day
			
	foodBar.deplete_food(usedFoodPerDay)
	emit_signal("day_change", day)

func _on_progress_bar_value_changed(value):
	if value >= 90:
		$Timer.wait_time = secondsPerDay
		get_tree().get_root().find_child("MalfunctionLabel", true, false).visible = false
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
		
		var randomTimeEvent = rng.randi_range(1,4)
		if randomTimeEvent == 1:
			get_tree().get_root().find_child("MalfunctionLabel", true, false).visible = true
			$Timer.wait_time = timeEventSecondsPerDay

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

func _on_gear_toggled(button_pressed):
	deselect_other_buttons(0)
	
func _on_bearing_toggled(button_pressed):
	deselect_other_buttons(1)

func _on_piston_toggled(button_pressed):
	deselect_other_buttons(2)

func _on_spring_toggled(button_pressed):
	deselect_other_buttons(3)

func _on_fuel_toggled(button_pressed):
	deselect_other_buttons(4)

func _on_potato_toggled(button_pressed):
	deselect_other_buttons(5)

func _on_tomato_toggled(button_pressed):
	deselect_other_buttons(6)

func _on_wheat_toggled(button_pressed):
	deselect_other_buttons(7)

func _on_carrot_toggled(button_pressed):
	deselect_other_buttons(8)

func _on_broccoli_toggled(button_pressed):
	deselect_other_buttons(9)

func _on_seed_inventory_seed_count_changed():
	print("here")
	update_button_values()

func update_button_values():
	buttons[0].text = str(seedInventory.get_gear_seeds())
	buttons[1].text = str(seedInventory.get_bearing_seeds())
	buttons[2].text = str(seedInventory.get_piston_seeds())
	buttons[3].text = str(seedInventory.get_spring_seeds())
	buttons[4].text = str(seedInventory.get_fuel_seeds())
	buttons[5].get_node("Label").text = str(seedInventory.get_potato_seeds())
	buttons[6].get_node("Label").text = str(seedInventory.get_tomato_seeds())
	buttons[7].get_node("Label").text = str(seedInventory.get_wheat_seeds())
	buttons[8].get_node("Label").text = str(seedInventory.get_carrot_seeds())
	buttons[9].get_node("Label").text = str(seedInventory.get_broccoli_seeds())

func _on_button_pressed():
	$Timer.wait_time = seasonSkipSecondsPerDay
	
func get_season() -> int:
	return season
