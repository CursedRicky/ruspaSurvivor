extends Node2D
class_name Gun

@export var bullet : PackedScene
var canShoot = true
var death = false


func _process(delta):
	shoot()

func shoot():
	if !death:
		if canShoot:
			canShoot = false
			for i in Global.bullet_num:
				var new_bullet = bullet.instantiate()
				new_bullet.global_position = global_position
				if Global.bullet_num == 1:
					new_bullet.rotation = global_rotation
				else :
					var arc_rad = deg_to_rad(Global.arc)
					var increment = arc_rad / (Global.bullet_num - 1)
					new_bullet.global_rotation = (
						global_rotation +
						increment * i -
						arc_rad / 2
					)
				get_tree().root.call_deferred("add_child", new_bullet)
				
			$AudioStreamPlayer2D.pitch_scale = randf_range(.8, 1.4)
			$AudioStreamPlayer2D.play()
			await get_tree().create_timer(1 / Global.fire_rate).timeout
			canShoot = true

