extends Control

@onready var _gameManager

@export var LevelList: Array
@export var Level0: PackedScene
@export var Level1: PackedScene
@export var Level2: PackedScene
@export var Level3: PackedScene

func _ready():
	var _start = get_node("ButtonCont/Next")
	var _gameManager = get_tree().current_scene.get_node("GameScene/GameManager")
	var _quit = get_node("ButtonCont/Quit")
	
	LevelList.append_array([Level0, Level1,Level2,Level3])
	
	_start.connect("pressed",onNextPressed)
	_quit.connect("pressed",onQuitPressed)
	
func onNextPressed():
	get_tree().current_scene.get_node("GameScene/GameManager").Level += 1
			
	var currLevel = LevelList[get_tree().current_scene.get_node("GameScene/GameManager").Level].instantiate()
	
	get_parent().add_child(currLevel)
	
	print(get_tree().current_scene.get_node("GameScene/GameManager").Level)
	
	queue_free()
	
func onQuitPressed():
	get_tree().quit()
