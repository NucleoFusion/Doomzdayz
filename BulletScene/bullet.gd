extends CharacterBody2D

@export var speed = 1000
@export var direction = Vector2.ZERO

@onready var _sprite = get_node("Sprite2D")
@onready var _gameManager

func _ready() -> void:
	_sprite.rotation = direction.angle()
	_gameManager = get_tree().current_scene.get_node("GameScene/GameManager")
	add_to_group("bullets")

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	
	var collide = move_and_collide(velocity*delta)
	if collide:
		var node = collide.get_collider()
		
		if node.is_in_group("enemies"):
			_gameManager.add_score(node.Score)
			node.queue_free()
			queue_free()
		
		
