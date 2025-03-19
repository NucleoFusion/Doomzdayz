extends CharacterBody2D

@export var speed = 100
@export var _bulletScene: PackedScene

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _shootTimer = get_node("ShootTimer")
@onready var _bulletMarker = get_node("AnimatedSprite2D/BulletSpawn")

var _currAngle = Vector2.ZERO.angle()
var _shotCooldown = false

func _ready() -> void:
	
	global_position = Vector2(583,292)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot") && !_shotCooldown:
		_shotCooldown = true
		_shootTimer.start()
		
		shoot_bullet()

func _physics_process(delta: float) -> void:
	handleMovement()
	_sprite.rotation = _currAngle
	move_and_slide()


func handleMovement():
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		_currAngle += deg_to_rad(2)

	if Input.is_action_pressed("move_left"):
		_currAngle -= deg_to_rad(2)

	if Input.is_action_pressed("move_up"):
		velocity.y -= 2

	if Input.is_action_pressed("move_down"):
		velocity.y += 2

	velocity = velocity.rotated(_currAngle)
	velocity = velocity * speed
	
	 

func shoot_bullet() -> void:
	var bullet = _bulletScene.instantiate()
	
	bullet.global_position = _bulletMarker.global_position
	bullet.direction = Vector2.UP.rotated(_currAngle)

	get_tree().current_scene.add_child(bullet)

func _on_shoot_timeout() -> void:
	_shotCooldown = false
	
