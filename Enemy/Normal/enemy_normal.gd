extends CharacterBody2D

@export var Lives = 1
@export var Speed = 50
@export var Damage = 100
@export var Score = 100

@onready var _player

func _ready() -> void:
	_player = get_tree().current_scene.get_node("Player/CharacterBody2D")
	add_to_group("enemies")

func _process(delta: float) -> void:
	if Lives <= 0:
		queue_free()

func _physics_process(delta: float) -> void:
	var playerPosition = _player.global_position
	
	var veloDirection = (playerPosition - global_position)
	
	velocity = veloDirection.normalized() * Speed
	
	var collision = move_and_collide(velocity * delta)
	if collision:
		var node = collision.get_collider()
		
		if node.is_in_group("bullets"):
			node.queue_free()
			Lives -= 1
		if node.is_in_group("player"):
			Lives -= 1
			node.Lives -= 1
