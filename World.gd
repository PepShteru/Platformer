extends Node2D

func _process(delta):
	# Check if the ESC key is pressed
	if Input.is_action_pressed("ui_cancel"):
		# Restart the scene
		get_tree().reload_current_scene()


