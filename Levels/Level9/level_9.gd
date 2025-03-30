extends Node2D

@export var EnemyShootMove: PackedScene
@export var EnemyShoot: PackedScene
@export var EnemyNormal: PackedScene
@export var EnemyList = []

@onready var _levelComplete = false
@onready var _player
@onready var _levelTimer =  false
@onready var _gameManager

func _ready():
	_player = get_tree().current_scene.get_node_or_null("GameScene/Player/CharacterBody2D")
	var _gameManager = get_tree().current_scene.get_node_or_null("GameScene/GameManager")

	for i in range(3):
		create_enemy()

func _process(delta: float) :
	for i in range(EnemyList.size() - 1,-1,-1):
		if !is_instance_valid(EnemyList[i]):
			EnemyList.remove_at(i)
			
	if _levelTimer and EnemyList.size() == 0 && !_levelComplete:
		_levelComplete = true
		var manager = load("res://LevelManager/level_manager.tscn").instantiate()
		manager.nextLevel = "res://Levels/BossLevel/boss_level.tscn"
		get_tree().current_scene.get_node("GameScene").add_child(manager)
	
	
func rand_coord():
	var screen = get_viewport_rect().size
	var playerPos = _player.global_position
	 
	var x_range = randf_range(0, screen.x)
	var y_range = randf_range(0,screen.y)
	
	if x_range > playerPos.x - float(100) and x_range < playerPos.x + 100:
		if  y_range > playerPos.y - float(100) and y_range < playerPos.y + float(100):
			return rand_coord()	
	for i in EnemyList:
		var enemyPos = i.global_position
		if x_range > enemyPos.x - float(100) and x_range < enemyPos.x + float(100):
			if  y_range > enemyPos.y - float(100) and y_range < enemyPos.y + float(100):
				return rand_coord()	
				
	return Vector2(x_range,y_range)

func create_enemy():
	var enemy = EnemyShootMove.instantiate()
	var enemy2 = EnemyShoot.instantiate()
	var enemy3 = EnemyNormal.instantiate()
	
	enemy.global_position = rand_coord()
	enemy2.global_position = rand_coord()
	enemy3.global_position = rand_coord()
	
	EnemyList.append(enemy)
	EnemyList.append(enemy3)
	EnemyList.append(enemy3)
	
	var n = randi_range(0,3)
	
	if n==0:
		get_tree().current_scene.get_node("GameScene").add_child.call_deferred(enemy)
	elif n==1:
		get_tree().current_scene.get_node("GameScene").add_child.call_deferred(enemy2)
	else:
		get_tree().current_scene.get_node("GameScene").add_child.call_deferred(enemy3)



func _on_spawn_timer_timeout() -> void:
	if !_levelTimer:
		create_enemy()




func _on_level_9_timer_timeout() -> void:
	_levelTimer = true
