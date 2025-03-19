extends Control



func _ready():
	var _start = get_node("ButtonCont/Start")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onStartPressed)
	_quit.connect("pressed",onQuitPressed)
	
func onStartPressed():
	get_tree().change_scene_to_file("res://GameScene/game_scene.tscn")
	
func onQuitPressed():
	get_tree().quit()
