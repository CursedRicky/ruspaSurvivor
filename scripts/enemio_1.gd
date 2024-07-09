extends CharacterBody2D

@export var exp = randi_range(1,3) * Global.expBoost
var deaths = false
var hp = randi_range(Global.enemy1Hp,Global.enemy1Hp*1.2)
var ms = 30.0
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var sprite = $AnimatedSprite2D
@onready var shadow = $AnimatedSprite2D/Sprite2D
@onready var damageNumberOrigin = $DamageNumberOrigin
@onready var loot_base = get_tree().get_first_node_in_group("Loot")
var exp_gem = preload("res://scenes/Xp/XpY.tscn")
var canMove = true
var elite = false
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	Global.mobCounter+=1
	if randi_range(1,100) == 3:
		elite = true
	if elite:
		$AnimationPlayer.play("elite")
		hp *= 10
		exp *= 3
	else :
		$AnimationPlayer.play("notElite")

func _physics_process(_delta):
	if !elite:
		$hitBox.damage = Global.enemy1Damage
	else :
		$hitBox.damage = Global.enemy1Damage * 1.5
	if canMove :
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * ms
		move_and_slide()
	
		if direction.x >0.1:
			sprite.flip_h = true
			shadow.offset.x = -6
		elif direction.x < -0.1:
			sprite.flip_h = false
			shadow.offset.x = 0

func _on_hurt_box_hurt(damage):
	if !deaths :
		$Hurt.play()
		hp-=damage+Global.damageUp
		DamageNumbers.dispay_number(damage+Global.damageUp, damageNumberOrigin.global_position, false)
		if hp > 0:
			sprite.play("Damage")
			await sprite.animation_finished
			sprite.play("default")
		else :
			death()
		
func death():
	Global.mobCounter-=1
	deaths = true
	$AudioStreamPlayer2D.play()
	sprite.play("Death")
	canMove = false
	$hitBox.monitorable = false
	$CollisionShape2D.disabled = true
	var new_gem = exp_gem.instantiate()
	new_gem.global_position = global_position
	new_gem.exp = exp
	loot_base.call_deferred("add_child", new_gem)
	Global.cs += 1
	await sprite.animation_finished
	queue_free()

func _on_timer_2_timeout():
	var location_dif = global_position - player.global_position
	if abs(location_dif.x) > (screen_size.x/2) *1.3 || abs(location_dif.y) > (screen_size.y/2) * 1.4:
		visible = false
	else:
		visible = true
