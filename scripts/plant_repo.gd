extends Node

signal set_plant_repo(repo)

var potatoPlant = preload("res://prefabs/FoodPlants/potato_part_plant.tscn")
var broccoliPlant = preload("res://prefabs/FoodPlants/broccoli_part_plant.tscn")
var carrotPlant = preload("res://prefabs/FoodPlants/carrot_part_plant.tscn")
var tomatoPlant = preload("res://prefabs/FoodPlants/tomato_part_plant.tscn")
var wheatPlant = preload("res://prefabs/FoodPlants/wheat_part_plant.tscn")

var gearPlant = preload("res://prefabs/PartPlants/gear_part_plant.tscn")
var pistonPlant = preload("res://prefabs/PartPlants/piston_part_plant.tscn")
var bearingPlant = preload("res://prefabs/PartPlants/bearing_part_plant.tscn")
var fuelPlant = preload("res://prefabs/PartPlants/fuel_part_plant.tscn")
var springPlant = preload("res://prefabs/PartPlants/spring_part_plant.tscn")


func getPlantFromType(type):
	if (type == 1):
		return potatoPlant
	if (type == 2):
		return broccoliPlant
	if (type == 3):
		return carrotPlant
	if (type == 4):
		return tomatoPlant
	if (type == 5):
		return wheatPlant
	if (type == 6):
		return gearPlant
	if (type == 7):
		return pistonPlant
	if (type == 8):
		return bearingPlant
	if (type == 9):
		return fuelPlant
	if (type == 10):
		return springPlant

# Called when the node enters the scene tree for the first time.
func _ready():
	set_plant_repo.emit(self)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
