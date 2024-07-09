extends Control

var replay = false
var quit = false

@onready var selected = $Selected
@onready var pressed = $Pressed

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Click"):
		SaveScore.save_score(Global.record)
		if replay:
			$"../../Blur".play_backwards("blur")
			$".".visible = false
			if Global.cs > Global.record :
				Global.record = Global.cs
			SaveScore.save_score(Global.record)
			resetGlobal()
			pressed.play()
			Global.canPause = true
			SceneTrans.reload_scene()
		if quit:
			pressed.play()
			if Global.cs > Global.record :
				Global.record = Global.cs
			SaveScore.save_score(Global.record)
			Global.canPause = true
			resetGlobal()
			SceneTrans.change_scene("res://UI/Main.tscn")


func _on_replay_mouse_entered():
	replay = true
	$Replay.scale = Vector2(.6,.6)
	selected.play()

func _on_replay_mouse_exited():
	replay = false
	$Replay.scale = Vector2(.5,.5)

func _on_esci_mouse_entered():
	quit = true
	$Esci.scale = Vector2(.6, .6)
	selected.play()

func _on_esci_mouse_exited():
	quit = false
	$Esci.scale = Vector2(.5, .5)
	
func resetGlobal():
	Global.bullet_num = 1
	Global.arc = 35
	Global.fire_rate = .5
	Global.damageUp = 1

	Global.clean = false
	Global.item = null
	Global.seconds = 0
	Global.minutes = 0

	Global.enemy1Hp = 200
	Global.enemy2Hp = 250
	Global.enemy3Hp = 400
	Global.enemy1Damage = 20
	Global.enemy2Damage = 35
	Global.enemy3Damage = 15

	Global.expBoost = 1
	Global.cs = 0
	
	Global.spellTime = 12
	Global.canMagnet = false
	Global.mobCounter = 0
	Global.canPause = true
	
	Global.coneCount = 0
	Global.lvl = 0

