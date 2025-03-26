extends Control

@export var nextLevel = ""
@onready var _levelLabel

func _ready():
	get_tree().current_scene.get_node("GameScene/GameManager").isLevelManager = true
	
	clear_entities()
	relocate_player()
	
	var _start = get_node("ButtonCont/Next")
	var _quit = get_node("ButtonCont/Quit")
	
	_start.connect("pressed",onNextPressed)
	_quit.connect("pressed",onQuitPressed)

	_levelLabel = get_node("LevelLabel")

func _process(delta: float) -> void:
	_levelLabel.text = "Level " + str(get_tree().current_scene.get_node("GameScene/GameManager").Level) + " Completed!"
	
func onNextPressed():
	get_tree().current_scene.get_node("GameScene/GameManager").Level += 1

	var currLevel = get_tree().current_scene.get_node("GameScene/Level")
	var next = load(nextLevel).instantiate()

	if currLevel and is_instance_valid(currLevel):
		currLevel.get_parent().remove_child(currLevel)
		currLevel.call_deferred("free")
		
	
	
	next.name = "Level"
	get_tree().current_scene.get_node("GameScene").add_child(next)

	get_tree().current_scene.get_node("GameScene/GameManager").isLevelManager = false

	get_parent().remove_child(self)
	queue_free()
	
	
func onQuitPressed():
	get_tree().quit()
	
func clear_entities():
	var children = get_tree().current_scene.get_node("GameScene").get_children()
	
	for i in children:
		if i.is_in_group("bullet") || i.is_in_group("enemy_bullet") || i.is_in_group("powerup"):
			i.queue_free()

func relocate_player():
	var screen = get_viewport_rect().size
	var player = get_tree().current_scene.get_node("GameScene/Player/CharacterBody2D")
	player.global_position = Vector2(screen.x/2, screen.y/2)
