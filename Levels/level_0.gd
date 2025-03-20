extends Node2D

@export var EnemyNormal: PackedScene

@onready var _player



func _ready():
	_player = get_tree().current_scene.get_node_or_null("Player/CharacterBody2D")
	for i in range(5):
		create_enemy()
	#print(get_tree().current_scene)
	if _player:
		print("player")
	
func rand_coord():
	var screen_x = get_viewport_rect().size.x
	var screen_y = get_viewport_rect().size.y
	 
	var x_range=randf_range(0,screen_x)
	var y_range=randf_range(0,screen_y)
	
	if x_range > _player.global_position.x - 100 and x_range < _player.global_positon.x +100:
		if  y_range > _player.global_position.y - 100 and y_range < _player.global_positon.y +100:
			return rand_coord()	
	
	return Vector2(x_range,y_range)

func create_enemy():
	var enemy = EnemyNormal.instantiate()
	
	enemy.global_position = rand_coord()
	
	get_tree().current_scene.add_child(enemy)
	
	

#func _on_spawn_time_timeout():
	#create_enemy()
