extends Control

var canPlay = false
var canQuit = false

@onready var title = $Label
@onready var selected = $Selected
@onready var pressed = $Pressed
# Called when the node enters the scene tree for the first time.
func _ready():
	animate()
	$Record.text = "Record: " + str(Global.record)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Click"):
		if canPlay:
			SceneTrans.change_scene("res://scenes/World.tscn")
			pressed.play()
		if canQuit:
			SaveScore.save_score(Global.record)
			pressed.play()
			get_tree().quit()
			
func animate():
	pass


func _on_skill_gap_mouse_entered():
	$SkillGap.scale = Vector2(1.1, 1.1)
	canPlay = true
	selected.play()
	


func _on_skill_gap_2_mouse_exited():
	$SkillGap2.scale = Vector2(1, 1)
	canQuit = false

func _on_skill_gap_mouse_exited():
	$SkillGap.scale = Vector2(1, 1)
	canPlay = false


func _on_skill_gap_2_mouse_entered():
	$SkillGap2.scale = Vector2(1.1, 1.1)
	canQuit = true
	selected.play()


func _on_audio_btn_mouse_entered():
	$AudioBTN.scale = Vector2(.25, .25)
	selected.play()


func _on_audio_btn_mouse_exited():
	$AudioBTN.scale = Vector2(.2, .2)


func _on_shop_btn_mouse_entered():
	$ShopBTN.scale = Vector2(.25, .25)
	selected.play()


func _on_shop_btn_mouse_exited():
	$ShopBTN.scale = Vector2(.2, .2)


func _on_animator_timeout():
	animate()
