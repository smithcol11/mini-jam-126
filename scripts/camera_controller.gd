extends Camera3D

@export var smallestPanSpeed : float
@export var largestPanSpeed : float
@export var zoomSpeed : float
@export var smallestZoom : float = 20.0
@export var largestZoom : float = 80.0

var initialPosition : Vector3
var zoomVal : float = 1.0 # zoom between 0.0 and 1.0

var enableControls = false;

# Called when the node enters the scene tree for the first time.
func _ready():
	initialPosition = transform.origin

func evaluateScreenSize(zoom):
	var x = zoom
	var y = pow(x, 1.5)
	return smallestZoom + ((largestZoom - smallestZoom) * y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (enableControls):
		update_input(delta)
			
func update_input(delta):
	var xdir = 0
	var ydir = 0
	if Input.is_action_pressed("ScreenPanLeft"):
		xdir -= 1
	if Input.is_action_pressed("ScreenPanRight"):
		xdir += 1
	if Input.is_action_pressed("ScreenPanUp"):
		ydir += 1
	if Input.is_action_pressed("ScreenPanDown"):
		ydir -= 1
		
	var zoomFactor = 0
	if Input.is_action_just_released("ScreenZoomIn"):
		zoomFactor -= 1
	if Input.is_action_just_released("ScreenZoomOut"):
		zoomFactor += 1
		
	if (zoomFactor != 0):
		zoomVal += zoomFactor * zoomSpeed * delta
		zoomVal = clampf(zoomVal, 0.0, 1.0)
		
	size = evaluateScreenSize(zoomVal)
		
	if (xdir != 0 or ydir != 0):
		var y = 1 - pow(zoomVal, 1.5)
		var pSpeed = largestPanSpeed - ((largestPanSpeed - smallestPanSpeed) * y)
		var moveVec = Vector3(pSpeed * xdir * delta, pSpeed * ydir * delta, 0)
		translate_object_local(moveVec)


func _on_start_menu_start_game():
	enableControls = true
