extends Area2D

enum PowerUp {
	SHIELD,
	LIFE,
	TRIPLE,
	WAVE,
	SCORE
}

@export var CurrAction = PowerUp.SHIELD

func _ready() -> void:
	add_to_group("powerup")
	connect("body_entered", _on_body_entered)
	$AnimatedSprite2D.play("live")

func _process(delta: float) -> void:
	match CurrAction:
		PowerUp.SHIELD: $AnimatedSprite2D.play("shield")
		PowerUp.LIFE: $AnimatedSprite2D.play("live")
		PowerUp.TRIPLE: $AnimatedSprite2D.play("triple")
		PowerUp.WAVE: $AnimatedSprite2D.play("wave")
		PowerUp.SCORE: $AnimatedSprite2D.play("score")

func _physics_process(delta: float) -> void:
	position.y += 40 * delta

func setType(type: int):
	match type:
		0: CurrAction = PowerUp.SHIELD
		1: CurrAction = PowerUp.LIFE
		2: CurrAction = PowerUp.TRIPLE
		3: CurrAction = PowerUp.WAVE
		4: CurrAction = PowerUp.SCORE	
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		apply_powerup(body)
	
func apply_powerup(player):
	# Add logic to apply the power-up effect
	queue_free()  # Remove power-up after collection
