extends Node3D
var rng = RandomNumberGenerator.new()
@export var growthDistance : float = 0.5
var plantData
var distancePerDay
var days_alive

var hud
# Called when the node enters the scene tree for the first time.
func _ready():
	days_alive = 0
	hud = get_tree().get_root().find_child("Hud", true, false)
	hud.day_change.connect(_on_hud_day_change)
	

func assign_plant_data(data):
	plantData = data
	distancePerDay = growthDistance / plantData["mature_time"]
	print(distancePerDay)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_hud_day_change(day):
	days_alive += 1
	var moveVec = Vector3(0, distancePerDay, 0)
	translate_object_local(moveVec)
	if days_alive == plantData["mature_time"]:
		if plantData["ID"] > 5:
			#food plant:
			hud.add_health(plantData["food_restored"])
			
		if plantData["ID"] == 1:
			var amount = rng.randi_range(plantData["yieldMin"], plantData["yieldMax"])
			hud.add_gear(amount)
		if plantData["ID"] == 2:
			var amount = rng.randi_range(plantData["yieldMin"], plantData["yieldMax"])
			hud.add_piston(amount)
		if plantData["ID"] == 3:
			var amount = rng.randi_range(plantData["yieldMin"], plantData["yieldMax"])
			hud.add_bearing(amount)
		if plantData["ID"] == 4:
			var amount = rng.randi_range(plantData["yieldMin"], plantData["yieldMax"])
			hud.add_fuel(amount)
		if plantData["ID"] == 5:
			var amount = rng.randi_range(plantData["yieldMin"], plantData["yieldMax"])
			hud.add_spring(amount)
			
		queue_free()
