extends Node2D


@export var spawns: Array[Spawn_info] = []

@onready var player = get_tree().get_first_node_in_group("Player")

var time = 0


func _on_timer_timeout():
	if Global.mobCounter < 400:
		time += 1
		var enemy_spanws = spawns
		for i in enemy_spanws:
			if time >= i.time_start and time <= i.time_end:
				if i.spawn_delay_counter < i.enemy_spawn_delay:
					i.spawn_delay_counter += 1
				else :
					i.spawn_delay_counter = 0
					var new_enemy = i.enemy
					var counter = 0
					while counter < i.enemy_num:
						var enemy_spawn = new_enemy.instantiate()
						enemy_spawn.global_position = get_random_position()
						add_child(enemy_spawn)
						counter += 1

func get_random_position():
	var vpr = get_viewport_rect().size * randi_range(1.1, 1.4)
	var top_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y - vpr.y/2)
	var top_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y - vpr.y/2)
	var bot_left = Vector2(player.global_position.x - vpr.x/2, player.global_position.y + vpr.y/2)
	var bot_right = Vector2(player.global_position.x + vpr.x/2, player.global_position.y + vpr.y/2)
	var pos_side = ["up", "down", "right", "left"].pick_random()
	var spawn_pos1 = Vector2.ZERO
	var spawn_pos2 = Vector2.ZERO
	
	match pos_side:
		"up":
			spawn_pos1 = top_left
			spawn_pos2 = top_right
		"down":
			spawn_pos1 = bot_left
			spawn_pos2 = bot_right
		"right":
			spawn_pos1 = bot_right
			spawn_pos2 = top_right
		"left":
			spawn_pos1 = bot_left
			spawn_pos2 = top_left
			
	var x_spawn = randf_range(spawn_pos1.x, spawn_pos2.x)
	var y_spawn = randf_range(spawn_pos1.y, spawn_pos2.y)
	return Vector2(x_spawn, y_spawn)
