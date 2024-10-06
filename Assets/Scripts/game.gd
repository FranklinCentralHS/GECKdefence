extends Node2D

var level1 = preload("res://Scenes/level_1.tscn")
var level2 = preload("res://Scenes/level_2.tscn")
var levels = [level1, level2]

var bat = preload("res://Scenes/bat.tscn")
var Green = preload("res://Scenes/enemy_green.tscn")
var Red = preload("res://Scenes/enemy_red.tscn")

var towerWeak = preload("res://Scenes/tower_weak.tscn")
var towerMedium = preload("res://Scenes/tower_medium.tscn")
var towerStrong = preload("res://Scenes/tower_strong.tscn")

var selectedTower:PackedScene = null

var path;

var level:Node = null;
var remainingEnemies = 5*global.wave;
var towers = [];

@onready var timer = get_node("SpawnTimer")

func _ready():
	selectedTower=towerMedium
	load_level(level1)

func load_level(scene:PackedScene):
	for tower in towers:
		self.remove_tower(tower.position)
	
	if level:
		self.remove_child(level)
		
	level = scene.instantiate()
	self.add_child(level)
	self.move_child(level,-1)
	path = level.get_node("Path2D")
	

func _process(_delta):
	if global.health<=0:
		get_tree().change_scene_to_file("res://Scenes/dead.tscn")
		
	var statsLabel:Label = self.get_node("Stats")
	statsLabel.text = "$%s  Health: %s  Wave: %s" % [global.coins, global.health, global.wave]

func _on_spawn_timer_timeout():
	if remainingEnemies > 0:
		#print("adding new bat")
		var enemy_picker = randi_range(0,10)
		if global.wave>=3:
			if enemy_picker > 8:
				var newGreen = Green.instantiate()
				remainingEnemies -= 1
				path.add_child(newGreen)
			else:
				var newBat = bat.instantiate()
				remainingEnemies -= 1
				path.add_child(newBat)
		else:
			if enemy_picker>9:
				var newRed = Red.instantiate()
				remainingEnemies -= 1
				path.add_child(newRed)
			if enemy_picker > 6:
				var newGreen = Green.instantiate()
				remainingEnemies -= 1
				path.add_child(newGreen)
			else:
				var newBat = bat.instantiate()
				remainingEnemies -= 1
				path.add_child(newBat)

func add_tower(position):
	var newTower:Tower = selectedTower.instantiate()
	
	var cost = newTower.get_cost()
	
	
	if global.mouseOverTowers > 0:
		return false
		
	if global.coins < cost:
		return false
		
	global.coins -= cost
	
	#print("adding tower")
	print(timer.wait_time)
	newTower.position = position;
	towers.append(newTower)
	self.add_child(newTower)
	
	return true
	
func remove_tower(position):
	for tower in self.towers:
		print(tower.position, "  ", position)
		if tower.position == position:
			self.remove_child(tower)
			self.towers.remove_at(self.towers.find(tower))
			global.coins += tower.get_cost() / 2


func _on_button_pressed():
	if remainingEnemies > 0:
		return
		
	if global.wave < 3:
		global.wave += 1
	else:
		global.wave = 1
		
		if global.level == 1:
			global.level = 2
			self.load_level(level2)
		else:
			global.level = 1
			self.load_level(level1)

		
	timer.wait_time = 1 / global.wave*2
	print("Wave:", global.wave)
	remainingEnemies = 5 * global.wave
	


func _on_make_weak_pressed():
	selectedTower = towerWeak

func _on_make_medium_pressed():
	selectedTower = towerMedium

func _on_make_strong_pressed():
	selectedTower = towerStrong
