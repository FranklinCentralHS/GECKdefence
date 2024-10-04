extends Tower
class_name TowerMedium


func _ready():
	self.range = 10
	self.fireRate = 0.1
	self.fireVelocity = 400
	self.power = 5
	self.cost = 40
	
	super._ready()
