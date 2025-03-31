extends CharacterBody2D

@export var Speed = 40
@export var Lives = 30
@export var Score = 2000

@onready var _currDirection = Vector2.LEFT

func _ready() -> void:
	add_to_group("enemies")
	
func _process(delta: float) -> void:
	if Lives <= 0:
		queue_free()

func _physics_process(delta: float) -> void:
	if global_position.x < 180:
		_currDirection = Vector2.RIGHT
	if global_position.x > get_viewport_rect().size.x - 180:
		_currDirection = Vector2.LEFT
	
	velocity = _currDirection * Speed
	move_and_slide()
	


func _on_barrage_timer_timeout() -> void:
	$Barrage.barrage()
