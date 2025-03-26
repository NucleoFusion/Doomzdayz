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
	print(CurrAction)
	connect("body_entered", _on_body_entered)

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
