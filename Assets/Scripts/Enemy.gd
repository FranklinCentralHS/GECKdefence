extends PathFollow2D
class_name Enemy
#all Enemy's will have this provided they have [extends Enemy]

#variables
#@export creates visability in the inspector in scenes that use them
@export var hp = 10
@export var speed = 100
@export var damage = 30
@export var coinValue = 10

func _ready():
	self.hp = 10 * global.wave
	self.speed = 100 * global.wave

func _process(delta):
	if self.hp <= 0:
		var parent = self.get_parent()
		parent.remove_child(self)
		global.coins += self.coinValue
		
	self.set_progress(self.get_progress() + self.speed * delta)


	if self.progress_ratio > 0.99:
		global.health-=damage
		print(global.health)
		self.get_parent().remove_child(self)
	if speed>300:
		speed=300
		var evolve_number = randf_range(0,1)
		if evolve_number==1:
			damage+=5
		else:
			hp+=1

func _on_bat_area_entered(area):
	if area.name == "Bullet":
		var parent = self.get_parent()
		if parent != null:
			self.hp -= 5
			var bullet = area.get_parent()
			bullet.remove()
			
			


	print(area.name)
