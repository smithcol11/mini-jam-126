extends DirectionalLight3D

var rotation_speed = 0.0698132

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func _process(delta):
	transform = transform.rotated(Vector3(0,0,1), rotation_speed * delta)
