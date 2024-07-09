extends CharacterBody2D

var ms = 20.0
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $Sprite2D

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * ms
	move_and_slide()
	
	if direction.x >0.1:
		sprite.flip_h = false
	elif direction.x < -0.1:
		sprite.flip_h = true


func _on_hurt_box_hurt(damage):
	queue_free()
