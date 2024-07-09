extends CharacterBody2D

@onready var hitbox = $hitBox
@export var SPEED = 2
var direction = Vector2.RIGHT
@export var lifetime = 3.0

func _ready():
	direction = Vector2.RIGHT.rotated(global_rotation)
	var randDamage = (hitbox.damage + Global.damageUp) * 1.1
	hitbox.damage = randi_range(hitbox.damage, hitbox.damage+randDamage)
	

func _process(delta):
	velocity = direction * SPEED
	var collision = move_and_collide(velocity)
	$hitBox.damage = Global.enemy2Damage
	
	if collision:
		queue_free()
	
	await get_tree().create_timer(lifetime).timeout
	queue_free()
