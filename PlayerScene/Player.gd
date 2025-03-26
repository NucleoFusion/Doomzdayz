extends CharacterBody2D

enum PlayerAction {
	MENU,
	ALIVE,
	DEAD,
	SHEILDED
}

@export var speed = 400
@export var _bulletScene: PackedScene
@export var Lives = 3

@onready var _sprite = get_node("AnimatedSprite2D")
@onready var _shootTimer = get_node("ShootTimer")
@onready var _bulletMarker = get_node("AnimatedSprite2D/BulletSpawn")
@onready var _currAction = PlayerAction.ALIVE

var _currAngle = Vector2.ZERO.angle()
var _shotCooldown = false

func _ready() -> void:
	add_to_group("player")

func _process(delta: float) -> void:
	if Lives <= 0:
		get_tree().current_scene.change_scene("death")

func _physics_process(delta: float) -> void:
	handleMovement()
	rotation = _currAngle
	if Input.is_action_pressed("shoot") && !_shotCooldown:
		_shotCooldown = true
		_shootTimer.start()
		
		shoot_bullet()
	move_and_slide()


func handleMovement():
	velocity = Vector2.ZERO

	if Input.is_action_pressed("move_right"):
		_currAngle += deg_to_rad(3)

	if Input.is_action_pressed("move_left"):
		_currAngle -= deg_to_rad(3)

	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if Input.is_action_pressed("move_down"):
		velocity.y += 1

	velocity = velocity.rotated(_currAngle)
	velocity = velocity * speed
	
	 

func shoot_bullet() -> void:
	var bullet = _bulletScene.instantiate()
	
	bullet.global_position = _bulletMarker.global_position
	bullet.direction = Vector2.UP.rotated(_currAngle)

	get_tree().current_scene.add_child(bullet)

func _on_shoot_timeout() -> void:
	_shotCooldown = false

func _remove_life() -> void:
	if _currAction != PlayerAction.SHEILDED:
		Lives -= 1
	



	
