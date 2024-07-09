extends CharacterBody2D
class_name Player

var speed = 70
var maxHp = 800
var hp = maxHp
const ACCELERATION = 400
const JUMP_VELOCITY = -400.0
var healtReg = 0

var xp = 0
var lvl = 1
var collected_xp = 0

var dmgRed = 1

# Upgrades
var collected_upgrades = []
var upgrade_options = []
var armor = 0
var canMove = true

var collectedN = 0

@export var healtBar: TextureProgressBar

@onready var lvlUpPanel = %LvlUpPanel
@onready var upgradeOptions = %UpgradeStack
@onready var itemOption = preload("res://scenes/item_option.tscn")
@onready var collected1 = $CanvasLayer/Bar/Collected1
@onready var collected2 = $CanvasLayer/Bar/Collected2
@onready var collected3 = $CanvasLayer/Bar/Collected3
@onready var itemContainer = preload("res://UI/item_container.tscn")

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	healtBar.value = hp * 100 / maxHp
	$CanvasLayer/Bar/xpBar.value = 0
	$CanvasLayer/Bar/Lvl.text = str(lvl)
	lvlUpPanel.visible = false
	$CanvasLayer/Death.visible = false
	get_tree().paused = false
	$Blur.play_backwards("blur")

func _physics_process(delta):
	if canMove:
		var inputVector = Vector2.ZERO
		$Gun.rotation = global_position.direction_to(get_global_mouse_position()).angle()
		inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
		inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		inputVector = inputVector.normalized() #Vettore normalizzato così che il pg non sia più veloce in diagonale
		
		if Input.get_action_strength("ui_right") > Input.get_action_strength("ui_left"):
			$Sprite.flip_h = true
		elif Input.get_action_strength("ui_right") < Input.get_action_strength("ui_left"): 
			$Sprite.flip_h = false
		
		if inputVector != Vector2.ZERO:
			velocity = velocity.move_toward(inputVector * speed, ACCELERATION * delta)
			$Sprite.play("Walk")
		else :
			$Sprite.play("idle")
			velocity = velocity.move_toward(Vector2.ZERO, ACCELERATION * delta)
		move_and_slide()


func _on_hurt_box_hurt(damage):
	hp-=damage*dmgRed
	print(hp)
	healtBar.value = hp * 100 / maxHp
	if hp > 0:
		$AnimationPlayer.play("Blink")
		$Damage.pitch_scale = randf_range(1, 1.5)
		$Damage.play()
	else :
		death()


func _on_grab_area_area_entered(area):
	if area.is_in_group("Loot"):
		area.target = self


func _on_callect_area_area_entered(area):
	if area.is_in_group("Loot"):
		var gem_exp = area.collect()
		calculate_exp(gem_exp)
		
func calculate_exp(gem_exp):
	var exp_required = calculate_expCap()
	collected_xp += gem_exp
	if xp + collected_xp >= exp_required: # lvl up
		collected_xp -= exp_required-xp
		lvl += 1
		xp = 0
		exp_required = calculate_expCap()
		lvlUp()
	else :
		xp += collected_xp
		collected_xp = 0
	$CanvasLayer/Bar/xpBar.value = xp*100 / calculate_expCap()

func calculate_expCap():
	var exp_cap = lvl
	if lvl < 5:
		exp_cap = lvl * 5
	elif lvl < 10:
		exp_cap = 20 + (lvl)*7
	elif lvl < 15:
		exp_cap = 50 + (lvl)*10
	else :
		exp_cap = 100 + (lvl)*12
	return exp_cap


func lvlUp():
	Global.lvl = lvl
	$Blur.play("blur")
	$AudioStreamPlayer2D.play()
	$CanvasLayer/Bar/Lvl.text = str(lvl)
	Global.canPause = false
	var tween = lvlUpPanel.create_tween()
	tween.tween_property(lvlUpPanel, "position", Vector2(383, -80), 0.2).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_IN)
	tween.play()
	lvlUpPanel.visible = true
	var options = 0
	var optionsmax = 3
	while options < optionsmax:
		var option_choise = itemOption.instantiate()
		option_choise.item = get_random_item()
		upgradeOptions.add_child(option_choise)
		options+=1
	$CanvasLayer/TimeRect.visible = false
	get_tree().paused = true
	

func upgrade_chara(upgrade):
	match upgrade:
		"healt1":
			maxHp+=150
			hp+=150
			healtBar.value = hp * 100 / maxHp
		"healt2":
			maxHp+=175
			hp+=175
			healtBar.value = hp * 100 / maxHp
		"healt3":
			maxHp+=200
			hp+=200
			healtBar.value = hp * 100 / maxHp
		"healt4":
			maxHp+=215
			hp+=215
			healtBar.value = hp * 100 / maxHp
		"healt5":
			maxHp+=230
			hp+=230
			healtBar.value = hp * 100 / maxHp
		"healt6":
			maxHp+=300
			hp+=300
			healtBar.value = hp * 100 / maxHp
		"ms1":
			speed*=1.07
		"ms2":
			speed/=1.07
			speed*=1.15
		"ms3":
			speed/=1.15
			speed*=1.24
		"ms4":
			speed/=1.24
			speed*=1.30
		"ms5":
			speed/=1.30
			speed*=1.41
		"ms6":
			speed/=1.41
			speed*=1.5
		"projectile1":
			Global.bullet_num += 1
		"projectile2":
			Global.bullet_num += 1
			Global.arc += 5
		"projectile3":
			Global.bullet_num += 1
		"projectile4":
			Global.bullet_num += 1
			Global.arc += 5
		"projectile5":
			Global.bullet_num += 1
		"projectile6":
			Global.bullet_num += 2
			Global.arc += 5
		"ah1":
			Global.fire_rate += .25
			Global.spellTime = 10.5
		"ah2":
			Global.fire_rate += .25
			Global.spellTime = 9
		"ah3":
			Global.fire_rate += .25
			Global.spellTime = 8
		"ah4":
			Global.fire_rate += .25
			Global.spellTime = 7
		"ah5":
			Global.fire_rate += .25
			Global.spellTime = 6
		"ah6":
			Global.fire_rate += .35
			Global.spellTime = 4
		"damage1":
			Global.damageUp += 20
		"damage2":
			Global.damageUp += 40
		"damage3":
			Global.damageUp += 60
		"damage4":
			Global.damageUp += 70
		"damage5":
			Global.damageUp += 80
		"damage6":
			Global.damageUp += 100
		"regen1":
			healtReg = 5
		"regen2":
			healtReg = 7
		"regen3":
			healtReg = 10
		"regen4":
			healtReg = 15
		"regen5":
			healtReg = 20
		"regen6":
			healtReg = 50
		"armor1":
			dmgRed = .95
		"armor2":
			dmgRed = .9
		"armor3":
			dmgRed = .85
		"armor4":
			dmgRed = .8
		"armor5":
			dmgRed = .75
		"armor6":
			dmgRed = .65
		"pick1":
			$GrabArea/CollisionShape2D.shape.set_radius(55)
		"pick2":
			$GrabArea/CollisionShape2D.shape.set_radius(60)
		"pick3":
			$GrabArea/CollisionShape2D.shape.set_radius(65)
		"pick4":
			$GrabArea/CollisionShape2D.shape.set_radius(70)
		"pick5":
			$GrabArea/CollisionShape2D.shape.set_radius(75)
		"pick6":
			$GrabArea/CollisionShape2D.shape.set_radius(100)
		"expB1":
			Global.expBoost = 1.25
		"expB2":
			Global.expBoost = 1.5
		"expB3":
			Global.expBoost = 1.75
		"expB4":
			Global.expBoost = 2
		"expB5":
			Global.expBoost = 2.25
		"expB6":
			Global.expBoost = 3
		"spell11":
			$Explosion/hitBox/CollisionShape2D.shape.set_radius(110)
			$Explosion/Thunder.amount += 5
		"spell12":
			$Explosion/hitBox/CollisionShape2D.shape.set_radius(115)
			$Explosion/Thunder.amount += 5
		"spell13":
			$Explosion/hitBox/CollisionShape2D.shape.set_radius(120)
			$Explosion/Thunder.amount += 5
		"spell14":
			$Explosion/hitBox/CollisionShape2D.shape.set_radius(125)
			$Explosion/Thunder.amount += 5
		"spell15":
			$Explosion/hitBox/CollisionShape2D.shape.set_radius(130)
			$Explosion/Thunder.amount += 5
		"spell16":
			$Explosion/hitBox/CollisionShape2D.shape.set_radius(135)
			$Explosion/Thunder.amount += 10
		"magnet" :
			Global.canMagnet = true
		"cone1":
			Global.coneCount += 1
			$COTU.radius += 10
		"cone2":
			Global.coneCount += 1
			$COTU.radius += 10
		"cone3":
			Global.coneCount += 1
			$COTU.radius += 10
		"cone4":
			Global.coneCount += 1
			$COTU.radius += 10
		"cone5":
			Global.coneCount += 1
			$COTU.radius += 10
		"food":
			if hp + 200 <= maxHp:
				hp += 200
			else :
				hp = maxHp
			healtBar.value = hp * 100 / maxHp
			
	adjust_gui_collection(upgrade)
	Global.clean = false
	var option_children = upgradeOptions.get_children()
	for i in option_children:
		i.queue_free()
	upgrade_options.clear()
	collected_upgrades.append(upgrade)
	lvlUpPanel.visible = false
	Global.canPause = true
	lvlUpPanel.position = Vector2(2000, 2000)
	$Blur.play_backwards("blur")
	get_tree().paused = false
	$CanvasLayer/TimeRect.visible = true
	calculate_exp(0)

func get_random_item():
	var dblist = []
	for i in UpgradeDb.UPGRADES:
		if i in collected_upgrades:
			pass
		elif i in upgrade_options:
			pass
		# elif UpgradeDb.UPGRADES[i]["type"] == "heal":
			# pass
		elif UpgradeDb.UPGRADES[i]["prerequisite"].size() > 0:
			for n in UpgradeDb.UPGRADES[i]["prerequisite"]:
				if not n in collected_upgrades:
					pass
				else:
					dblist.append(i)
		else :
			dblist.append(i)
	if dblist.size() > 0:
		var randomitem = dblist.pick_random()
		upgrade_options.append(randomitem)
		return randomitem
	else: 
		return null


func _on_timer_timeout():
	hp += healtReg
	healtBar.value = hp * 100 / maxHp


func death():
	Global.canPause = false
	$Sprite.play("death")
	$CanvasLayer/Death.visible = true
	$Blur.play("blur")
	get_tree().paused = true
	

func adjust_gui_collection(upgrade):
	var get_upgraded_display_names = UpgradeDb.UPGRADES[upgrade]["displayname"]
	var get_type = UpgradeDb.UPGRADES[upgrade]["type"]
	if get_type != "heal":
		var get_collected_display_names = []
		for i in collected_upgrades:
			get_collected_display_names.append(UpgradeDb.UPGRADES[i]["displayname"])
		if not get_upgraded_display_names in get_collected_display_names:
			var new_item = itemContainer.instantiate()
			collectedN+=1
			new_item.upgrade = upgrade
			if collectedN <= 5:
				collected1.add_child(new_item)
			elif collectedN <= 10 :
				collected2.add_child(new_item)
			else :
				collected3.add_child(new_item)
