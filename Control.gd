extends Control

func _on_Button_pressed():
	get_tree().change_scene("res://World.tscn")
	get_tree().emit_signal("screen_exit")


func _on_ExitButton_pressed():
	get_tree().quit()



