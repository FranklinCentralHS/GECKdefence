extends StaticBody2D
class_name TowerBase

var has_tower = false
var mouse_over = false


func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed:
		print("tower has_tower: ", self.has_tower)
		if self.has_tower == true and event.button_index == MOUSE_BUTTON_MASK_RIGHT:
			self.get_node("/root/Game").remove_tower(self.position)
			self.has_tower = false

		elif self.has_tower == false and event.button_index == MOUSE_BUTTON_LEFT:
			self.has_tower = self.get_node("/root/Game").add_tower(self.position)
