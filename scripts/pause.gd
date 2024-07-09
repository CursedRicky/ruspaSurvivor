extends Control

@export var blurAnimator : AnimationPlayer
var active = false
var resumeB = false
var replayB = false
var quitB = false

@onready var pressed = $Pressed
@onready var selected = $Selected

# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Pause") and Global.canPause:
		active = !active
		visible = active
		if active:
			blurAnimator.play("blur")
			pause()
		else:
			resume()
			blurAnimator.play_backwards("blur")
	
	if active:
		if Input.is_action_just_pressed("Click") and resumeB:
			pressed.play()
			blurAnimator.play_backwards("blur")
			visible = false
			active = false
			resume()
		if Input.is_action_just_pressed("Click") and replayB:
			blurAnimator.play_backwards("blur")
			resetGlobal()
			pressed.play()
			visible = false
			SceneTrans.reload_scene()
		if Input.is_action_just_pressed("Click") and quitB:
			pressed.play()
			blurAnimator.play_backwards("blur")
			visible = false
			resetGlobal()
			SceneTrans.change_scene("res://UI/Main.tscn")
	
		
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

func pause():
	get_tree().paused = true
	
func resume():
	get_tree().paused = false

func _on_resume_mouse_entered():
	resumeB = true
	$Resume.scale = Vector2(.3,.3)
	selected.play()

func _on_resume_mouse_exited():
	$Resume.scale = Vector2(.25,.25)
	resumeB = false

func _on_replay_mouse_entered():
	$Replay.scale = Vector2(.3,.3)
	replayB = true
	selected.play()

func _on_replay_mouse_exited():
	$Replay.scale = Vector2(.25,.25)
	replayB = false

func _on_quit_mouse_entered():
	$Quit.scale = Vector2(.3,.3)
	quitB = true
	selected.play()

func _on_quit_mouse_exited():
	quitB = false
	$Quit.scale = Vector2(.25,.25)
