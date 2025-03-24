extends Control

@export var nextLevel = ""

func _ready():
	var _start = get_node("ButtonCont/Next")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onNextPressed)
	_quit.connect("pressed",onQuitPressed)
	
func onNextPressed():
	get_tree().current_scene.get_node("GameScene/GameManager").Level += 1
	
	var currLevel = get_tree().current_scene.get_node("GameScene/Level")
	var next = load(nextLevel).instantiate()
	
	if currLevel and is_instance_valid(currLevel):
		currLevel.get_parent().remove_child(currLevel)
		currLevel.call_deferred("free")
		
	next.name = "Level"
	get_tree().current_scene.get_node("GameScene").add_child(next)

	get_parent().remove_child(self)
	queue_free()
	
func onQuitPressed():
	get_tree().quit()
