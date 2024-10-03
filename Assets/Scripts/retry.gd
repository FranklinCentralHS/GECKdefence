extends Button




func _on_pressed():
	global.health=100
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
