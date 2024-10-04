extends Node2D

var bat = preload("res://Scenes/bat.tscn")
var towerWeak = preload("res://Scenes/tower_weak.tscn")
var towerMedium = preload("res://Scenes/tower_medium.tscn")
var towerStrong = preload("res://Scenes/tower_strong.tscn")

var selectedTower:PackedScene = null

var path;

var remainingEnemies = 5*global.wave;
var towers = [];

@onready var timer = get_node("SpawnTimer")
var level = "Level1"

func _ready():
	selectedTower=towerMedium
	level = get_node(level)
	path = level.get_node("Path2D")

func _process(_delta):
	if global.health<=0:
		get_tree().change_scene_to_file("res://Scenes/dead.tscn")
		
	var statsLabel:Label = self.get_node("Stats")
	statsLabel.text = "$%s  Health: %s  Wave: %s" % [global.coins, global.health, global.wave]

func _on_spawn_timer_timeout():
	if remainingEnemies > 0:
		#print("adding new bat")
		var newBat = bat.instantiate()
		remainingEnemies -= 1
		path.add_child(newBat)
		

func add_tower(position):
	var newTower = selectedTower.instantiate()
	var cost = newTower.cost
	
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


func _on_button_pressed():
	if remainingEnemies<=0:
		global.wave += 1
		timer.wait_time = 1 / global.wave*2
		print("Wave:", global.wave)
		remainingEnemies = 5 * global.wave


func _on_make_weak_pressed():
	selectedTower = towerWeak

func _on_make_medium_pressed():
	selectedTower = towerMedium

func _on_make_strong_pressed():
	selectedTower = towerStrong
