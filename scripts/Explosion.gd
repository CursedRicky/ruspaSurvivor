extends Node2D

@onready var particle = $Thunder
@onready var hitbox = $hitBox/CollisionShape2D
@onready var progress = $"../CanvasLayer/Spell/TextureProgressBar"
@onready var timeNumber = $"../CanvasLayer/Spell/TimeNumber"
@onready var spellTimer = $Timer

var canCast = true
var firstTime = true

func _ready():
	hitbox.disabled = true
	timeNumber.visible = false
	progress.value = 100

func _process(delta):
	if Global.lvl == 3 and firstTime:
		progress.value = 0
		firstTime = false
	
	if Global.lvl >= 3:
		progress.value = spellTimer.time_left * 100 / spellTimer.wait_time
		timeNumber.text = str(round_place(spellTimer.time_left, 1))
	
	if canCast and Global.lvl >= 3:
		if Input.is_action_just_pressed("Spell1"):
			var randDamage = (100 + Global.damageUp) * 2
			$hitBox.damage = randi_range($hitBox.damage, randDamage)
			spellTimer.start()
			timeNumber.visible = true
			canCast = false
			particle.emitting = true
			hitbox.disabled = false
			await get_tree().create_timer(.5).timeout
			hitbox.disabled = true


func _on_timer_timeout():
	canCast = true
	timeNumber.visible = false
	
	spellTimer.wait_time = Global.spellTime
	
func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))
