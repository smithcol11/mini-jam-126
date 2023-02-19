extends Control

var is_paused = false : set = set_is_paused, get = get_is_paused

func _ready():
	var gearPlant = get_parent().get_node("SeedInventory").get_part_plant(1)
	var pistonPlant = get_parent().get_node("SeedInventory").get_part_plant(2)
	var bearingPlant = get_parent().get_node("SeedInventory").get_part_plant(3)
	var fuelPlant = get_parent().get_node("SeedInventory").get_part_plant(4)
	var springPlant = get_parent().get_node("SeedInventory").get_part_plant(5)
	
	var potatoPlant = get_parent().get_node("SeedInventory").get_food_plant(1)
	var tomatoPlant = get_parent().get_node("SeedInventory").get_food_plant(2)
	var wheatPlant = get_parent().get_node("SeedInventory").get_food_plant(3)
	var carrotPlant = get_parent().get_node("SeedInventory").get_food_plant(4)
	var broccoliPlant = get_parent().get_node("SeedInventory").get_food_plant(5)
	
	updatePartSeedLabel("GearSeedLabel", gearPlant)
	updatePartSeedLabel("PistonSeedLabel", pistonPlant)
	updatePartSeedLabel("BearingSeedLabel", bearingPlant)
	updatePartSeedLabel("FuelSeedLabel", fuelPlant)
	updatePartSeedLabel("SpringSeedLabel", springPlant)
	
	updateFoodSeedLabel("PotatoSeedLabel", potatoPlant)
	updateFoodSeedLabel("TomatoSeedLabel", tomatoPlant)
	updateFoodSeedLabel("WheatSeedLabel", wheatPlant)
	updateFoodSeedLabel("CarrotSeedLabel", carrotPlant)
	updateFoodSeedLabel("BroccoliSeedLabel", broccoliPlant)

func updatePartSeedLabel(labelName, partSeedDict):
	get_tree().get_root().find_child(labelName, true, false).text = str("Gear Plant\n", "Yield Min: ", partSeedDict["yieldMin"], "\n", "Yield Max: ", partSeedDict["yieldMax"])
		
func updateFoodSeedLabel(labelName, foodSeedDict):
	get_tree().get_root().find_child(labelName, true, false).text = str("Potato Plant\n", "Mature Time: ", foodSeedDict["mature_time"], "\n", "Preferred Season: ", foodSeedDict["preferred_season"], "\n", "Death Season: ", foodSeedDict["death_season"], "\n", "Food Restored: ", foodSeedDict["food_restored"] )
	
func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	visible = is_paused
	
func get_is_paused() -> bool:
	return is_paused

func _on_resume_button_pressed():
	self.is_paused = false

func _on_hud_year_change(year):
	set_is_paused(true)
