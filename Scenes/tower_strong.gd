extends Tower
class_name TowerStrong


func _ready():
	self.range = 10
	self.fireRate = 0.25
	self.fireVelocity = 1000
	self.power = 40
	self.cost = 50
	
	super._ready()
