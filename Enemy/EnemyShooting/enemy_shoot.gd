extends CharacterBody2D

@export var Lives = 1
@export var Speed = 50
@export var Damage = 100
@export var Score = 100
@export var BulletScene : PackedScene

@onready var _player
@onready var _gameManager = get_tree().current_scene.get_node("GameScene/GameManager")
@onready var _marker
@onready var _sprite

func _ready() -> void:
	_player = get_tree().current_scene.get_node("GameScene/Player/CharacterBody2D")
	_marker = get_node("BulletMarker")
	_sprite = get_node("AnimatedSprite2D")
	
	add_to_group("enemies")

func _process(delta: float) -> void:
	look_at(_player.global_position)
	rotation += PI/2
	
	if Lives <= 0:
		var n = randi_range(0,3)
		if n == 1:
			_gameManager.spawn_powerup()
		queue_free()

#func _physics_process(delta: float) -> void:
	
	
func shoot_bullet():
	var bullet = BulletScene.instantiate()
	bullet.direction = (_player.global_position - _marker.global_position).normalized()
	bullet.global_position = _marker.global_position 
	
	get_tree().current_scene.add_child(bullet)
	
func _on_timer_timeout() :
	shoot_bullet()
