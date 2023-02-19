extends Node3D

var winter_ground = preload("res://materials/ground_season_materials/winter_mat.tres")
var spring_ground = preload("res://materials/ground_season_materials/spring_mat.tres")
var summer_ground = preload("res://materials/ground_season_materials/summer_mat.tres")
var fall_ground = preload("res://materials/ground_season_materials/fall_mat.tres")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func change_season(season):
	if season == 1:
		$Enviornment2.set_surface_override_material(0, winter_ground)
	elif season == 2:
		$Enviornment2.set_surface_override_material(0, spring_ground)
	elif season == 3:
		$Enviornment2.set_surface_override_material(0, summer_ground)
	elif season == 4:
		$Enviornment2.set_surface_override_material(0, fall_ground)
