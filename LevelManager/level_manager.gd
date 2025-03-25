extends Control

@export var nextLevel = ""

@onready var _player

func _ready():
	var _start = get_node("ButtonCont/Next")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onNextPressed)
	_quit.connect("pressed",onQuitPressed)
	
func onNextPressed():
	get_tree().current_scene.get_node("GameScene/GameManager").Level += 1
	_player = get_tree().current_scene.get_node("GameScene/Player")
	var currLevel = get_tree().current_scene.get_node("GameScene/Level")
	var next = load(nextLevel).instantiate()
	var screen = get_viewport_rect().size
	_player.global_position = Vector2((screen.x)/2,(screen.y)/2)
	if currLevel and is_instance_valid(currLevel):
		currLevel.get_parent().remove_child(currLevel)
		currLevel.call_deferred("free")
		
	
	
	next.name = "Level"
	get_tree().current_scene.get_node("GameScene").add_child(next)

	get_parent().remove_child(self)
	queue_free()
	
func onQuitPressed():
	get_tree().quit()
