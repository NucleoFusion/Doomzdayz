extends Control



func _ready():
	var _start = get_node("ButtonCont/Start")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onStartPressed)
	_quit.connect("pressed",onQuitPressed)
	
func onStartPressed():
	get_parent().change_scene("game")
	
func onQuitPressed():
	get_tree().quit()
