extends CharacterBody2D

@export var Lives = 1
@export var Speed = 50
@export var Damage = 100
@export var Score = 100

@onready var _player
@onready var _gameManager = get_tree().current_scene.get_node("GameScene/GameManager")

func _ready() -> void:
	_player = get_tree().current_scene.get_node("GameScene/Player/CharacterBody2D")
	add_to_group("enemies")

func _process(delta: float) -> void:
	if Lives <= 0:
		var n = randi_range(0,2)
		if n == 1:
			_gameManager.spawn_powerup()
		queue_free()

func _physics_process(delta: float) -> void:
	var playerPosition = _player.global_position
	
	var veloDirection = (playerPosition - global_position)
	
	velocity = veloDirection.normalized() * Speed
	
	rotation += deg_to_rad(1.5)
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var node = collision.get_collider()
		if node.is_in_group("player"):
			Lives -= 1
			node.remove_life()
			
