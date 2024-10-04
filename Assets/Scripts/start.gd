extends Button


func _on_pressed():
	global.health=100
	global.health=60
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
