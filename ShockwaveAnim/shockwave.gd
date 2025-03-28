extends Node2D

@onready var _player = get_tree().current_scene.get_node("GameScene/Player")

func _ready() -> void:
	$AnimatedSprite2D.hide()

func startAnim():
	#$AnimatedSprite2D.global_position = _player.global_position
	$AnimatedSprite2D.show()
	$AnimatedSprite2D.play("default")
	
func _on_animated_sprite_2d_animation_finished() -> void:
	$AnimatedSprite2D.hide()
