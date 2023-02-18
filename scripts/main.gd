extends Node3D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	pass

func _on_start_menu_start_game():
	$StartMenu.queue_free()
