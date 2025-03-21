extends Node2D

@export var EnemyNormal: PackedScene

@onready var _player


func _ready():
	_player = get_tree().current_scene.get_node_or_null("GameScene/Player/CharacterBody2D")
	
	for i in range(5):
		create_enemy()
	
func rand_coord():
	var screen = get_viewport_rect().size
	var playerPos = _player.global_position
	 
	var x_range = randf_range(0, screen.x)
	var y_range = randf_range(0,screen.y)
	
	if x_range > playerPos.x - float(100) and x_range < playerPos.y + float(100):
		if  y_range > playerPos.y - float(100) and y_range < playerPos.y + float(100):
			return rand_coord()	
	
	return Vector2(x_range,y_range)

func create_enemy():
	var enemy = EnemyNormal.instantiate()
	enemy.global_position = rand_coord()
	
	get_tree().current_scene.add_child.call_deferred(enemy)

func _on_spawn_time_timeout():
	create_enemy()
