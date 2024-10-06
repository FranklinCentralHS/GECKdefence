extends Tower
class_name TowerStrong

func _ready():
	self.range = 10
	self.fireRate = 0.7
	self.fireVelocity = 1300
	self.power = 15
	
	super._ready()

func get_cost():
	return 150
