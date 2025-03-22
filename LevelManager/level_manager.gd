extends Control

@onready var _gameManager

func _ready():
	var _start = get_node("ButtonCont/Next")
	var _gameManager = get_tree().current_scene.get_node("GameScene/GameManager")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onNextPressed)
	_quit.connect("pressed",onQuitPressed)
	
func onNextPressed():
	get_tree().current_scene.get_node("GameScene/GameManager").Level += 1
	
func onQuitPressed():
	get_tree().quit()
