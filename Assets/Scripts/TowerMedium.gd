extends Tower
class_name TowerMedium


func _ready():
	self.range = 10
	self.fireRate = 0.1
	self.fireVelocity = 600
	self.power = 0.5
	
	super._ready()

func get_cost():
	return 70
