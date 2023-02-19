extends Node3D

var camera;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !get_tree().paused and Input.is_action_just_released("SelectWorldItem"):
		var mousePos = get_viewport().get_mouse_position()
		var ray_origin = camera.project_ray_origin(mousePos)
		var rayDistance = 2000
		var ray_target = ray_origin + camera.project_ray_normal(mousePos) * rayDistance
		var space_state = get_world_3d().direct_space_state
		var intersectQuery = PhysicsRayQueryParameters3D.create(ray_origin, ray_target)
		var intersect = space_state.intersect_ray(intersectQuery)
		
		if not intersect.is_empty():
			var pos = intersect.position
			var col : StaticBody3D = intersect.collider
			if col != null:
				var obj = col.get_parent_node_3d()
				if (obj.has_method("world_click")):
					obj.world_click()
					print("Clicked something! %s" % obj)

func _on_camera_3d_set_camera_signal(cam):
	camera = cam
