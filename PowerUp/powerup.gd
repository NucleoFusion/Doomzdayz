extends CharacterBody2D

enum PowerUp {
	SHIELD,
	LIFE,
	TRIPLE,
	WAVE,
	SCORE
}

@export var CurrAction = PowerUp.SHIELD
