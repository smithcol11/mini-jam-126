extends Node

enum {WINTER, SPRING, SUMMER, FALL}

var FoodPlant = {}
	
var PartPlant = {}
	
#part plants:
var gearPlant
var pistonPlant
var bearingPlant
var fuelPlant
var springPlant

#food plants:
var potatoPlant
var tomatoPlant
var wheatPlant
var carrotPlant
var broccoliPlant

# Called when the node enters the scene tree for the first time.
func _ready():
	#Setup part plants
	gearPlant = {"yieldMin": 10, "yieldMax": 25}
	pistonPlant = {"yieldMin": 5, "yieldMax": 15}
	bearingPlant = {"yieldMin": 5, "yieldMax": 10}
	fuelPlant = {"yieldMin": 5, "yieldMax": 15}
	springPlant = {"yieldMin": 1, "yieldMax": 2}
	
	#setup food plants
	potatoPlant = {"mature_time": 30, "preferred_season": "SUMMER", "death_season": "WINTER", "food_restored": 60 }
	tomatoPlant = {"mature_time": 45, "preferred_season": "SPRING", "death_season": "FALL", "food_restored": 90 }
	wheatPlant = {"mature_time": 20, "preferred_season": "SUMMER", "death_season": "SPRING", "food_restored": 20 }
	carrotPlant = {"mature_time": 60, "preferred_season": "SPRING", "death_season": "WINTER", "food_restored": 100 }
	broccoliPlant = {"mature_time": 25, "preferred_season": "FALL", "death_season": "SUMMER", "food_restored": 75 }
	
#**********************************************************************************************************************


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
