extends Node

enum {WINTER, SPRING, SUMMER, FALL}

var FoodPlant = {}
var PartPlant = {}

#part plants types:
var gearPlant
var pistonPlant
var bearingPlant
var fuelPlant
var springPlant

#food plants types:
var potatoPlant
var tomatoPlant
var wheatPlant
var carrotPlant
var broccoliPlant

#Inventory:
var partSeedInventory = {}
var foodSeedInventory = {}

signal seed_count_changed


# Called when the node enters the scene tree for the first time.
func _ready():
	partSeedInventory = {"gearSeeds": 0, "pistonSeeds": 0, "bearingSeeds": 0, "fuelSeeds": 0, "springSeeds": 0}
	foodSeedInventory = {"potatoSeeds": 0, "tomatoSeeds": 0, "wheatSeeds": 0, "carrotSeeds": 0, "broccoliSeeds": 0}
	
	#Setup part plants
	gearPlant = {"ID": 1, "yieldMin": 10, "yieldMax": 25, "mature_time": 45}
	pistonPlant = {"ID": 2, "yieldMin": 5, "yieldMax": 15, "mature_time": 45}
	bearingPlant = {"ID": 3, "yieldMin": 5, "yieldMax": 10, "mature_time": 45}
	fuelPlant = {"ID": 4, "yieldMin": 5, "yieldMax": 15, "mature_time": 45}
	springPlant = {"ID": 5, "yieldMin": 1, "yieldMax": 2, "mature_time": 45}
	
	#setup food plants
	potatoPlant = {"ID": 6, "mature_time": 30, "preferred_season": "SUMMER", "death_season": "WINTER", "food_restored": 60 }
	tomatoPlant = {"ID": 7, "mature_time": 45, "preferred_season": "SPRING", "death_season": "FALL", "food_restored": 90 }
	wheatPlant = {"ID": 8, "mature_time": 15, "preferred_season": "SUMMER", "death_season": "SPRING", "food_restored": 20 }
	carrotPlant = {"ID": 9, "mature_time": 60, "preferred_season": "SPRING", "death_season": "WINTER", "food_restored": 100 }
	broccoliPlant = {"ID": 10, "mature_time": 45, "preferred_season": "FALL", "death_season": "SUMMER", "food_restored": 75 }
	
#**********************************************************************************************************************

func get_part_seed_inventory() -> Dictionary:
	return partSeedInventory
	
func get_food_seed_inventory() -> Dictionary:
	return foodSeedInventory
	
func set_food_seed_inventory(foodInventory):
	foodSeedInventory = foodInventory
	emit_signal("seed_count_changed")
	
func set_part_seed_inventory(partInventory):
	partSeedInventory = partInventory
	emit_signal("seed_count_changed")

func get_part_plant(index) -> Dictionary:
	if index == 1:
		return gearPlant
	if index == 2:
		return pistonPlant
	if index == 3:
		return bearingPlant
	if index == 4:
		return fuelPlant
	if index == 5:
		return springPlant
	return {}

func get_food_plant(index) -> Dictionary:
	if index == 1:
		return potatoPlant
	if index == 2:
		return tomatoPlant
	if index == 3:
		return wheatPlant
	if index == 4:
		return carrotPlant
	if index == 5:
		return broccoliPlant
	return {}

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#Seed getters
func get_gear_seeds() -> int:
	return partSeedInventory["gearSeeds"]
	
func get_piston_seeds() -> int:
	return partSeedInventory["pistonSeeds"]
	
func get_bearing_seeds() -> int:
	return partSeedInventory["bearingSeeds"]
	
func get_fuel_seeds() -> int:
	return partSeedInventory["fuelSeeds"]

func get_spring_seeds() -> int:
	return partSeedInventory["springSeeds"]
	
func get_potato_seeds() -> int:
	return foodSeedInventory["potatoSeeds"]
	
func get_tomato_seeds() -> int:
	return foodSeedInventory["tomatoSeeds"]
	
func get_wheat_seeds() -> int:
	return foodSeedInventory["wheatSeeds"]
	
func get_carrot_seeds() -> int:
	return foodSeedInventory["carrotSeeds"]

func get_broccoli_seeds() -> int:
	return foodSeedInventory["broccoliSeeds"]
	
#Seed setters
func add_gear_seeds(seedCount):
	partSeedInventory["gearSeeds"] = partSeedInventory["gearSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_piston_seeds(seedCount):
	partSeedInventory["pistonSeeds"] = partSeedInventory["pistonSeeds"] + seedCount
	emit_signal("seed_count_changed")	
	
func add_bearing_seeds(seedCount):
	partSeedInventory["bearingSeeds"] = partSeedInventory["bearingSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_fuel_seeds(seedCount):
	partSeedInventory["fuelSeeds"] = partSeedInventory["fuelSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_spring_seeds(seedCount):
	partSeedInventory["springSeeds"] = partSeedInventory["springSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_potato_seeds(seedCount):
	foodSeedInventory["potatoSeeds"] = foodSeedInventory["potatoSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_tomato_seeds(seedCount):
	foodSeedInventory["tomatoSeeds"] = foodSeedInventory["tomatoSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_wheat_seeds(seedCount):
	foodSeedInventory["wheatSeeds"] = foodSeedInventory["wheatSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
func add_carrot_seeds(seedCount):
	foodSeedInventory["carrotSeeds"] = foodSeedInventory["carrotSeeds"] + seedCount
	emit_signal("seed_count_changed")

func add_broccoli_seeds(seedCount):
	foodSeedInventory["broccoliSeeds"] = foodSeedInventory["broccoliSeeds"] + seedCount
	emit_signal("seed_count_changed")
	
