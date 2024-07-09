extends CharacterBody2D

var hp = randi_range(Global.enemy3Hp,Global.enemy3Hp*1.2)
var ms = 30.0
var deaths = false
@export var exp = randi_range(3,6) * Global.expBoost
var exp_gem = preload("res://scenes/Xp/XpY.tscn")
@onready var player = get_tree().get_first_node_in_group("Player")
@onready var loot_base = get_tree().get_first_node_in_group("Loot")
@onready var sprite = $AnimatedSprite2D
@onready var shadow = $AnimatedSprite2D/Sprite2D
@onready var damageNumberOrigin = $DamageNumberOrigin
var canMove = true
var elite = false
var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	Global.mobCounter+=1
	if randi_range(1,100) == 5:
		elite = true
	if elite:
		$AnimationPlayer.play("elite")
		hp *= 10
		exp *= 3
	else:
		$AnimationPlayer.play("notElite")

func _physics_process(_delta):
	if !elite:
		$hitBox.damage = Global.enemy3Damage
	else :
		$hitBox.damage = Global.enemy3Damage * 1.5
	if canMove :
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * ms
		move_and_slide()
	
		if direction.x >0.1:
			sprite.flip_h = true
		elif direction.x < -0.1:
			sprite.flip_h = false

func _on_hurt_box_hurt(damage):
	if !deaths:
		hp-=damage+Global.damageUp
		$Hurt.play()
		DamageNumbers.dispay_number(damage+Global.damageUp, damageNumberOrigin.global_position, false)
		if hp > 0:
			sprite.play("Damage")
			await sprite.animation_finished
			sprite.play("default")
		else :
			Global.mobCounter-=1
			sprite.play("Death")
			$AudioStreamPlayer2D.play()
			deaths = true
			canMove = false
			$hitBox.monitorable = false
			$CollisionShape2D.disabled = true
			if sprite.flip_h :
				shadow.offset.x = -9
			else :
				shadow.offset.x = 9
			var new_gem = exp_gem.instantiate()
			new_gem.global_position = global_position
			new_gem.exp = exp
			loot_base.call_deferred("add_child", new_gem)
			Global.cs += 1
			await sprite.animation_finished
			queue_free()

func _on_timer_timeout():
	var location_dif = global_position - player.global_position
	if abs(location_dif.x) > (screen_size.x/2) *1.3 || abs(location_dif.y) > (screen_size.y/2) * 1.4:
		visible = false
	else:
		visible = true
