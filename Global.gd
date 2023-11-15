extends Node


func _unhandled_input(event):
	if event.is_action_pressed("menu"):
		get_tree().quit()
