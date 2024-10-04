extends CharacterBody2D





func _process(_delta):
	self.move_and_slide()
	
	var x = self.position[0]
	var y = self.position[1]
	
	if x < 0 or x > 1150 or y < 0 or y>648:
		print("removing bullet")
		self.get_parent().remove_child(self)

func remove():
	print("bullet hit, removing")
	self.get_parent().remove_child(self)
