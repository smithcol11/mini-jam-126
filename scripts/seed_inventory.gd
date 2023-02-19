extends Node

#enum {WINTER, SPRING, SUMMER, FALL}

class FoodPlant:
	var name: String
	var mature_time: int
	var preferred_seaons: Array
	var death_seasons: Array
	var food_restored: int
	
class PartPlant:
	var name: String
	var yieldMin: int
	var yieldMax: int
	
@export var partPlants : Array
@export var foodPlants : Array

# Called when the node enters the scene tree for the first time.
func _ready():
	#Setup part plants
	var gearPlant = PartPlant.new()
	gearPlant.name = "gearPlant"
	gearPlant.yieldMin = 10
	gearPlant.yieldMax = 25
	
	var pistonPlant = PartPlant.new()
	pistonPlant.name = "pistonPlant"
	pistonPlant.yieldMin = 5
	pistonPlant.yieldMax = 15
	
	var bearingPlant = PartPlant.new()
	bearingPlant.name = "bearingPlant"
	bearingPlant.yieldMin = 5
	bearingPlant.yieldMax = 10
	
	var fuelPlant = PartPlant.new()
	fuelPlant.name = "fuelPlant"
	fuelPlant.yieldMin = 5
	fuelPlant.yieldMax = 15
	
	var springPlant = PartPlant.new()
	springPlant.name = "springPlant"
	springPlant.yieldMin = 1
	springPlant.yieldMax = 2
	
	partPlants = [gearPlant, pistonPlant, bearingPlant, fuelPlant, springPlant]
	
	#setup food plants
	var potatoPlant = FoodPlant.new()
	potatoPlant.name = "potatoPlant"
	potatoPlant.mature_time = 30
	potatoPlant.preferred_seaons = ["SUMMER"]
	potatoPlant.death_seasons = ["WINTER"]
	potatoPlant.food_restored = 60
	
	var tomatoPlant = FoodPlant.new()
	tomatoPlant.name = "tomatoPlant"
	tomatoPlant.mature_time = 45
	tomatoPlant.preferred_seaons = ["SPRING", "SUMMER"]
	tomatoPlant.death_seasons = ["FALL", "WINTER"]
	tomatoPlant.food_restored = 90
	
	var wheatPlant = FoodPlant.new()
	wheatPlant.name = "wheatPlant"
	wheatPlant.mature_time = 20
	wheatPlant.preferred_seaons = ["SUMMER"]
	wheatPlant.death_seasons = []
	wheatPlant.food_restored = 20
	
	var carrotPlant = FoodPlant.new()
	carrotPlant.name = "carrotPlant"
	carrotPlant.mature_time = 60
	carrotPlant.preferred_seaons = ["SPRING", "FALL"]
	carrotPlant.death_seasons = ["WINTER"]
	carrotPlant.food_restored = 100
	
	var broccoliPlant = FoodPlant.new()
	broccoliPlant.name = "broccoliPlant"
	broccoliPlant.mature_time = 25
	broccoliPlant.preferred_seaons = ["WINTER"]
	broccoliPlant.death_seasons = ["SUMMER"]
	broccoliPlant.food_restored = 75
	
	foodPlants = [potatoPlant, tomatoPlant, wheatPlant, carrotPlant, broccoliPlant]
	
#**********************************************************************************************************************




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
