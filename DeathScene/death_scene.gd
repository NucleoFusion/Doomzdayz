extends Control

@export var Score = 0
@export var HighScore = 0

var _scoreLabel : Label
var _highScoreLabel : Label

func _ready():
	_scoreLabel = get_node("Score")
	_highScoreLabel = get_node("HighScore")
	
	_scoreLabel.text = "Score: " + str(Score)
	_highScoreLabel.text = "High Score: " + str(HighScore)
	
	var _start = get_node("ButtonCont/Start")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onStartPressed)
	_quit.connect("pressed",onQuitPressed)
	
	
	
func onStartPressed():
	get_parent().change_scene("game")
	
func onQuitPressed():
	get_tree().quit()
