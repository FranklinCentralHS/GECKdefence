extends Node2D


func _on_return_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
