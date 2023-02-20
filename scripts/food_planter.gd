extends Node3D
signal plant_seed(planter)
var plantRepo : Node
var plantInstance : Node3D = null
var rng : RandomNumberGenerator

var hud
var seedInventory

# Called when the node enters the scene tree for the first time.
func _ready():
	rng = RandomNumberGenerator.new()
	hud = get_tree().get_root().find_child("Hud", true, false)
	seedInventory = get_tree().get_root().find_child("SeedInventory", true, false)
	
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
	if (plantInstance == null):
		var selectedBtn = hud.get_selected_button()
		if (selectedBtn != null):
			attempt_seed_plant(selectedBtn)

func attempt_seed_plant(button):
	if button.name == "potato" && seedInventory.get_potato_seeds() > 0:
		_addPlant(1)
		seedInventory.add_potato_seeds(-1)
	if button.name == "tomato" && seedInventory.get_tomato_seeds() > 0:
		_addPlant(4)
		seedInventory.add_tomato_seeds(-1)
	if button.name == "wheat" && seedInventory.get_wheat_seeds() > 0:
		_addPlant(5)
		seedInventory.add_wheat_seeds(-1)
	if button.name == "carrot" && seedInventory.get_carrot_seeds() > 0:
		_addPlant(3)
		seedInventory.add_carrot_seeds(-1)
	if button.name == "broccoli" && seedInventory.get_broccoli_seeds() > 0:
		_addPlant(2)
		seedInventory.add_broccoli_seeds(-1)
		
	

func _on_plant_repo_set_plant_repo(repo):
	plantRepo = repo
