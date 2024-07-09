extends TextureRect

var minutes = 0
var seconds = 0
@onready var label = $Time
var timeformat = "%s : %s"

func _ready():
	pass

func _process(delta):
	label.text = timeformat % [minutes, seconds]


func _on_timer_timeout():
	seconds+=1
	if seconds == 60:
		minutes += 1
		seconds = 0
		Global.enemy1Damage *= 1.1
		Global.enemy2Damage *= 1.1
		Global.enemy3Damage *= 1.1
	Global.seconds = seconds
	Global.minutes = minutes
	Global.enemy1Hp += 1
	Global.enemy2Hp += 1
	Global.enemy3Hp += 1
	
