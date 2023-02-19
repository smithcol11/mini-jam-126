extends Node3D

var plantRepo : Node
var plantInstance : Node3D
var rng : RandomNumberGenerator

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _addPlant(plantType):
	var prefab : PackedScene = plantRepo.getPlantFromType(plantType)
	plantInstance = prefab.instantiate()
	add_child(plantInstance)
	plantInstance.transform.origin = Vector3.ZERO + Vector3.UP * 0.5

# is clickable
func world_click():
	var type = rng.randi_range(1, 5)
	_addPlant(type)
	print("holy fuckin shit we clicked a food planter")


func _on_plant_repo_set_plant_repo(repo):
	plantRepo = repo
