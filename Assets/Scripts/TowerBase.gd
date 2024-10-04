extends StaticBody2D
class_name TowerBase

var has_tower = false
var mouse_over = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		print("tower has_tower: ", self.has_tower)
		if self.has_tower:
			return

		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			self.has_tower = self.get_node("/root/Game").add_tower(self.position)
