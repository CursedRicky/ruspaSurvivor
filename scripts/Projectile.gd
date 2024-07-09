extends CharacterBody2D

@onready var hitbox = $hitBox
@export var SPEED = 2
var direction = Vector2.RIGHT
@export var lifetime = 3.0

func _ready():
	direction = Vector2.RIGHT.rotated(global_rotation)
	var randDamage = randi_range(1, (100 + Global.damageUp) * 1.2)
	hitbox.damage = hitbox.damage+randDamage

func _process(delta):
	velocity = direction * SPEED
	var collision = move_and_collide(velocity)
	
	if collision:
		queue_free()

func _on_timer_timeout():
	queue_free()
