extends CharacterBody2D

var _speed = 200
var _sprite 

func _ready() -> void:
    _sprite = get_node("AnimatedSprite2D")



func _physics_process(delta: float) -> void:
    handleMovement()

    if velocity.length() > 0:
        rotation = lerp_angle(rotation, velocity.angle(), 0.1* delta)

    move_and_slide()


func handleMovement():
    velocity = Vector2.ZERO


    if Input.is_action_pressed("move_right"):
        velocity.x += 1

    if Input.is_action_pressed("move_left"):
        velocity.x -= 1

    if Input.is_action_pressed("move_up"):
        velocity.y -= 1

    if Input.is_action_pressed("move_down"):
        velocity.y += 1

    velocity = velocity.normalized()
    velocity = velocity * _speed
    
     
