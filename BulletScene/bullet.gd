extends CharacterBody2D

@export var speed = 500
@export var direction = Vector2.ZERO

@onready var _sprite = get_node("Sprite2D")

func _ready() -> void:
	# global_position = global_position/2
	
	_sprite.rotation = direction.angle()

# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	velocity = direction * speed
	move_and_slide()
