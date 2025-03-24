extends Node

enum SceneEnum {
	START_MENU,
	GAME,
	DEATH_MENU
}

@export var CurrScene = SceneEnum.START_MENU
@export var MenuScene : PackedScene
@export var GameScene : PackedScene
@export var DeathScene : PackedScene
@export var details : Dictionary


func _process(delta: float) -> void:
	match CurrScene:
		SceneEnum.START_MENU:
			if has_node("MainMenu"):
				return
				
			for child in get_children():
				child.queue_free()
			
			
			var menu = MenuScene.instantiate()
			add_child(menu)
		
		SceneEnum.GAME:
			if has_node("GameScene"):
				return 
			
			for child in get_children():
				child.queue_free()
			
			var game = GameScene.instantiate()
			add_child(game)
			
		SceneEnum.DEATH_MENU:
			if has_node("DeathScene"):
				return
				
			for child in get_children():
				child.queue_free()
			
			var death = DeathScene.instantiate()
			var manager = get_node("GameScene/GameManager")
			
			death.Score = manager.Score
			death.Score = manager.HighScore
			
			add_child(death)
			
func change_scene(s: String):
	match s:
		"game":
			CurrScene = SceneEnum.GAME
			
		"start":
			CurrScene = SceneEnum.START_MENU
			
		"death":
			CurrScene = SceneEnum.DEATH_MENU
