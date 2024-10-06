extends Tower
class_name TowerWeak


func _ready():
	self.range = 10
	self.fireRate = 0.5
	self.fireVelocity = 500
	self.power = 3
	
	super._ready()
	
func get_cost():
	return 25
