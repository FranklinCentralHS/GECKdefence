extends Tower
class_name TowerWeak


func _ready():
	self.range = 10
	self.fireRate = 0.25
	self.fireVelocity = 400
	self.power = 5
	self.cost = 20
	
	super._ready()
