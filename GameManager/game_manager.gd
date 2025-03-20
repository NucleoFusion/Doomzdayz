extends Node

@export var Level = 0
@export var Score = 0
@export var HighScore = 0

@onready var _scoreLabel
@onready var _highScoreLabel
@onready var _livesLabel
@onready var _player

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_scoreLabel = get_tree().current_scene.get_node("HUD/Score")
	_highScoreLabel = get_tree().current_scene.get_node("HUD/HighScore")
	_livesLabel = get_tree().current_scene.get_node("HUD/Lives")
	_player = get_tree().current_scene.get_node("Player/CharacterBody2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Score >= HighScore:
		HighScore = Score
	
	_scoreLabel.text = "Score: " + str(Score)
	_highScoreLabel.text = "High Score: " + str(HighScore)
	_livesLabel.text = "Lives: " + str(_player.Lives)
