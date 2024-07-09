extends Node2D
class_name Gun_enemy

@export var bullet : PackedScene
var canShoot = true
var inRange = true
var bullet_num = 1
var arc = 5

func _process(delta):
	shoot()

func shoot():
	if inRange:
		if canShoot:
			canShoot = false
			for i in bullet_num:
				var new_bullet = bullet.instantiate()
				new_bullet.global_position = global_position
				if bullet_num == 1:
					new_bullet.rotation = global_rotation
				else :
					var arc_rad = deg_to_rad(arc)
					var increment = arc_rad / (bullet_num - 1)
					new_bullet.global_rotation = (
						global_rotation +
						increment * i -
						arc_rad / 2
					)
				get_tree().root.call_deferred("add_child", new_bullet)
				
			await get_tree().create_timer(1 / .5).timeout
			canShoot = true



func _on_area_2d_body_entered(body):
	inRange = true


func _on_area_2d_body_exited(body):
	inRange = false
