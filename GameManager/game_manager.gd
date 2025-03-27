extends Node

@export var Level = 0
@export var Score = 0
@export var HighScore = 0
@export var PowerUp: PackedScene
@export var isLevelManager = false
@export var Multiplier = 1

@onready var _scoreLabel
@onready var _highScoreLabel
@onready var _livesLabel
@onready var _levelLabel
@onready var _player


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_scoreLabel = get_tree().current_scene.get_node("GameScene/HUD/Score")
	_highScoreLabel = get_tree().current_scene.get_node("GameScene/HUD/HighScore")
	_livesLabel = get_tree().current_scene.get_node("GameScene/HUD/Lives")
	_levelLabel = get_tree().current_scene.get_node("GameScene/HUD/Level")
	_player = get_tree().current_scene.get_node("GameScene/Player/CharacterBody2D")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Score >= HighScore:
		HighScore = Score
	
	_scoreLabel.text = "Score: " + str(Score)
	_highScoreLabel.text = "High Score: " + str(HighScore)
	_livesLabel.text = "Lives: " + str(_player.Lives)
	_levelLabel.text = "Level: " + str(Level)
	

func spawn_powerup():
	var x_val = randf_range(0, get_viewport().size.x)
	var type = randi_range(0,5)
	var powerup = PowerUp.instantiate()
	
	powerup.global_position = Vector2(x_val, 50)
	powerup.setType(type)

	get_tree().current_scene.get_node("GameScene").add_child(powerup)

func add_score(score : int):
	Score += score*Multiplier

func _on_timer_timeout() -> void:
	if !isLevelManager:
		spawn_powerup()

func handleMulti():
	Multiplier = 2
	$MultiTimer.start()

func _on_multi_timer_timeout() -> void:
	Multiplier = 1
	$MultiTimer.stop()
	
