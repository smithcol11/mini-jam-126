extends CharacterBody3D

var rng = RandomNumberGenerator.new()

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

#variables
var speed = 3
var target = null
var xMinRange = -5
var xMaxRange = 3.5
var yMinRange = -5
var yMaxRange = 3.5

func _ready():
	$AnimationPlayer.play("idle")
	$Timer.start()
	target = self.position

	
func _process(delta):
	look_at(target, Vector3(0, 1, 0))
	position = position.move_toward(target, delta * speed)
	
func get_random_path() -> Vector3:
	return Vector3(rng.randf_range(xMinRange, xMaxRange), 0, rng.randf_range(yMinRange,yMaxRange))

func _on_timer_timeout():
	print("here")
	target = get_random_path()
	print(target)
	
