extends Node

@export var Level = 0
@export var Score = 0
@export var HighScore = 0

@onready var _scoreLabel
@onready var _highScoreLabel
@onready var _livesLabel
@onready var _levelLabel
@onready var _player
@onready var _gameManager


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_scoreLabel = get_tree().current_scene.get_node("GameScene/HUD/Score")
	_highScoreLabel = get_tree().current_scene.get_node("GameScene/HUD/HighScore")
	_livesLabel = get_tree().current_scene.get_node("GameScene/HUD/Lives")
	_levelLabel = get_tree().current_scene.get_node("GameScene/HUD/Level")
	_player = get_tree().current_scene.get_node("GameScene/Player/CharacterBody2D")
	_gameManager= get_tree().current_scene.get_node("GameScene/GameManager")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Score >= HighScore:
		HighScore = Score
	
	_scoreLabel.text = "Score: " + str(Score)
	_highScoreLabel.text = "High Score: " + str(HighScore)
	_livesLabel.text = "Lives: " + str(_player.Lives)
	_levelLabel.text = "Level: " + str(_gameManager.Level)
	
