extends Node2D

var bat = preload("res://Scenes/bat.tscn")
var towerWeak = preload("res://Scenes/tower_weak.tscn")

var path;

var remainingEnemies = 5*global.wave;
var towers = [];

@onready var timer = get_node("SpawnTimer")

func _ready():
	path = get_node("Map/Path2D")

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
	var cost = 20
	
	if global.mouseOverTowers > 0:
		return
		
	if global.coins < cost:
		return
		
	global.coins -= cost
	
	#print("adding tower")
	print(timer.wait_time)
	var newTower = towerWeak.instantiate()
	newTower.position = position;
	towers.append(newTower)
	self.add_child(newTower)


func _on_button_pressed():
	if remainingEnemies<=0:
		global.wave += 1
		timer.wait_time = 1 / global.wave*2
		print("Wave:", global.wave)
		remainingEnemies = 5 * global.wave
