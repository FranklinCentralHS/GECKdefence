extends Button


func _on_pressed():
	global.health=100
	global.coins=100
	global.wave=1
	get_tree().change_scene_to_file("res://Scenes/game.tscn")
