extends CharacterBody2D

@export var speed = 200
@export var direction = Vector2.ZERO

@onready var _sprite = get_node("Sprite2D")
@onready var _gameManager

func _ready() -> void:
	_sprite.rotation = direction.angle() + PI/2
	_gameManager = get_tree().current_scene.get_node("GameScene/GameManager")
	
	add_to_group("enemy_bullet")

func _process(delta: float) -> void:
	rotation += deg_to_rad(1)

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	velocity = direction.normalized() * speed

	var collide = move_and_collide(velocity*delta)
	
	if collide:
		var node = collide.get_collider()
		
		if node.is_in_group("player"):
			node.remove_life()
			queue_free()
