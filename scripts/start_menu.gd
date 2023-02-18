extends Control

signal start_game
var starting_game = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if starting_game and !$StartGameSound.playing:
		start_game.emit()

func _on_start_pressed():
	$StartGameSound.play()
	$MenuMusic.stop()
	starting_game = true

func _on_quit_pressed():
	pass # Replace with function body.
	get_tree().quit()
