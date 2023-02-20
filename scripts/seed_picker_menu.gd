extends Control
var rng = RandomNumberGenerator.new()

var is_paused = false : set = set_is_paused, get = get_is_paused

var gearSeedButton
var pistonSeedButton
var bearingSeedButton
var fuelSeedButton
var springSeedButton

var potatoSeedButton
var tomatoSeedButton
var wheatSeedButton
var carrotSeedButton
var broccoliSeedButton

var partSeedButtonArray
var foodSeedButtonArray

#Reference to seed inventory script/node:
var seedInventory


func _ready():
	rng.randomize()
	
	seedInventory = get_parent().get_node("SeedInventory")
	
	update_all_seed_descriptions()
	
	gearSeedButton = get_tree().get_root().find_child("GearSeedButton", true, false)
	pistonSeedButton = get_tree().get_root().find_child("PistonSeedButton", true, false)
	bearingSeedButton = get_tree().get_root().find_child("BearingSeedButton", true, false)
	fuelSeedButton = get_tree().get_root().find_child("FuelSeedButton", true, false)
	springSeedButton = get_tree().get_root().find_child("SpringSeedButton", true, false)

	potatoSeedButton = get_tree().get_root().find_child("PotatoSeedButton", true, false)
	tomatoSeedButton = get_tree().get_root().find_child("TomatoSeedButton", true, false)
	wheatSeedButton = get_tree().get_root().find_child("WheatSeedButton", true, false)
	carrotSeedButton = get_tree().get_root().find_child("CarrotSeedButton", true, false)
	broccoliSeedButton = get_tree().get_root().find_child("BroccoliSeedButton", true, false)
	
	partSeedButtonArray = [gearSeedButton, pistonSeedButton, bearingSeedButton, fuelSeedButton, springSeedButton]
	foodSeedButtonArray = [potatoSeedButton, tomatoSeedButton, wheatSeedButton, carrotSeedButton, broccoliSeedButton]

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
	if (checkSelectedButtonCount() != 3):
		get_tree().get_root().find_child("WarningLabel", true, false).visible = true
	else:
		add_selected_seeds_to_inventory()
		print(seedInventory.get_part_seed_inventory())
		print(seedInventory.get_food_seed_inventory())
		self.is_paused = false

func _on_hud_year_change(year):
	set_is_paused(true)
	
func checkSelectedButtonCount() -> int:
	var selectedCount = 0
	
	for btn in partSeedButtonArray:
		if btn.button_pressed == true:
			selectedCount += 1
	for btn in foodSeedButtonArray:
		if btn.button_pressed == true:
			selectedCount += 1
			
	return selectedCount
		
func add_selected_seeds_to_inventory():
	if (gearSeedButton.button_pressed == true):
		addPartSeeds("gearSeeds")
	if (pistonSeedButton.button_pressed == true):
		addPartSeeds("pistonSeeds")
	if (bearingSeedButton.button_pressed == true):
		addPartSeeds("bearingSeeds")
	if (fuelSeedButton.button_pressed == true):
		addPartSeeds("fuelSeeds")
	if (springSeedButton.button_pressed == true):
		addPartSeeds("springSeeds")
	if (potatoSeedButton.button_pressed == true):
		addFoodSeeds("potatoSeeds")
	if (tomatoSeedButton.button_pressed == true):
		addFoodSeeds("tomatoSeeds")
	if (wheatSeedButton.button_pressed == true):
		addFoodSeeds("wheatSeeds")
	if (carrotSeedButton.button_pressed == true):
		addFoodSeeds("carrotSeeds")
	if (broccoliSeedButton.button_pressed == true):
		addFoodSeeds("broccoliSeeds")
		
func addPartSeeds(seedName):
	var count = rng.randi_range(1, 5)
	var partSeedDict = seedInventory.get_part_seed_inventory()
	partSeedDict[seedName] = partSeedDict[seedName] + count
	seedInventory.set_part_seed_inventory(partSeedDict)
	
func addFoodSeeds(seedName):
	var count = rng.randi_range(1, 5)
	var foodSeedDict = seedInventory.get_food_seed_inventory()
	foodSeedDict[seedName] = foodSeedDict[seedName] + count
	seedInventory.set_food_seed_inventory(foodSeedDict)

func update_all_seed_descriptions():
	var gearPlant = seedInventory.get_part_plant(1)
	var pistonPlant = seedInventory.get_part_plant(2)
	var bearingPlant = seedInventory.get_part_plant(3)
	var fuelPlant = seedInventory.get_part_plant(4)
	var springPlant = seedInventory.get_part_plant(5)
	
	var potatoPlant = seedInventory.get_food_plant(1)
	var tomatoPlant = seedInventory.get_food_plant(2)
	var wheatPlant = seedInventory.get_food_plant(3)
	var carrotPlant = seedInventory.get_food_plant(4)
	var broccoliPlant = seedInventory.get_food_plant(5)
	
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
