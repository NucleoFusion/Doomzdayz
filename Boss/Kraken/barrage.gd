extends Node2D

@export var BulletScene: PackedScene

func barrage():
	var angle = 120
	for i in get_children():
		var bullet = BulletScene.instantiate()

		bullet.speed *= 2
		bullet.direction = Vector2.UP.rotated(deg_to_rad(angle))
		bullet.global_position = i.global_position
		
		get_tree().current_scene.get_node("GameScene").add_child(bullet)
		
		angle += 30
