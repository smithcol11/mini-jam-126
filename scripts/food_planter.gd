extends Node3D
signal plant_seed(planter)
var plantRepo : Node
var plantInstance : Node3D = null
var rng : RandomNumberGenerator

var hud
var seasonWarning : Label
var seedInventory

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	hud = get_tree().get_root().find_child("Hud", true, false)
	seasonWarning = hud.find_child("OutOfSeasonWarning", true, false)
	seedInventory = get_tree().get_root().find_child("SeedInventory", true, false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _addPlant(plantType, plantData):
	var prefab : PackedScene = plantRepo.getPlantFromType(plantType)
	plantInstance = prefab.instantiate()
	add_child(plantInstance)
	plantInstance.assign_plant_data(plantData)
	plantInstance.transform.origin = Vector3.ZERO + Vector3.UP * 0.12
# is clickable
func world_click():
	if (plantInstance == null):
		var selectedBtn = hud.get_selected_button()
		if (selectedBtn != null):
			attempt_seed_plant(selectedBtn)

func check_can_plant(plantInfo : Dictionary) -> bool:
	var deathSeason = plantInfo["death_season"]
	var seasonId
	if (deathSeason == "WINTER"):
		seasonId = 1
	elif (deathSeason == "SPRING"):
		seasonId = 2
	elif (deathSeason == "SUMMER"):
		seasonId = 3
	else:
		seasonId = 4
		
	if (seasonId == hud.get_season()):
		seasonWarning.show_warning(5)
		return false
	
	return true
	

func attempt_seed_plant(button):
	if button.name == "potato" && seedInventory.get_potato_seeds() > 0:
		var plantInfo = seedInventory.get_food_plant(1)
		if (check_can_plant(plantInfo)):
			_addPlant(1, plantInfo)
			seedInventory.add_potato_seeds(-1)
	if button.name == "tomato" && seedInventory.get_tomato_seeds() > 0:
		var plantInfo = seedInventory.get_food_plant(2)
		if (check_can_plant(plantInfo)):
			_addPlant(4, seedInventory.get_food_plant(2))
			seedInventory.add_tomato_seeds(-1)
	if button.name == "wheat" && seedInventory.get_wheat_seeds() > 0:
		var plantInfo = seedInventory.get_food_plant(3)
		if (check_can_plant(plantInfo)):
			_addPlant(5, seedInventory.get_food_plant(3))
			seedInventory.add_wheat_seeds(-1)
	if button.name == "carrot" && seedInventory.get_carrot_seeds() > 0:
		var plantInfo = seedInventory.get_food_plant(4)
		if (check_can_plant(plantInfo)):
			_addPlant(3, seedInventory.get_food_plant(4))
			seedInventory.add_carrot_seeds(-1)
	if button.name == "broccoli" && seedInventory.get_broccoli_seeds() > 0:
		var plantInfo = seedInventory.get_food_plant(5)
		if (check_can_plant(plantInfo)):
			_addPlant(2, seedInventory.get_food_plant(5))
			seedInventory.add_broccoli_seeds(-1)
	if button.name == "gear" && seedInventory.get_gear_seeds() > 0:
		var plantInfo = seedInventory.get_part_plant(1)
		_addPlant(6, seedInventory.get_part_plant(1))
		seedInventory.add_gear_seeds(-1)
	if button.name == "piston" && seedInventory.get_piston_seeds() > 0:
		var plantInfo = seedInventory.get_part_plant(2)
		_addPlant(7, seedInventory.get_part_plant(2))
		seedInventory.add_piston_seeds(-1)
	if button.name == "bearing" && seedInventory.get_bearing_seeds() > 0:
		var plantInfo = seedInventory.get_part_plant(3)
		_addPlant(8, seedInventory.get_part_plant(3))
		seedInventory.add_bearing_seeds(-1)
	if button.name == "fuel" && seedInventory.get_fuel_seeds() > 0:
		var plantInfo = seedInventory.get_part_plant(4)
		_addPlant(9, seedInventory.get_part_plant(4))
		seedInventory.add_fuel_seeds(-1)
	if button.name == "spring" && seedInventory.get_spring_seeds() > 0:
		var plantInfo = seedInventory.get_part_plant(5)
		_addPlant(10, seedInventory.get_part_plant(5))
		seedInventory.add_spring_seeds(-1)

func _on_plant_repo_set_plant_repo(repo):
	plantRepo = repo
