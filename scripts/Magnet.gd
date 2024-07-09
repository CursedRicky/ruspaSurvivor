extends TextureRect

@onready var grabArea = $"../../GrabArea/CollisionShape2D"
@onready var progress = $TextureProgressBar
@onready var timeNumber = $TimeNumber
@onready var spellTimer = $Timer

var canCast = true

func _ready():
	timeNumber.visible = false

func _process(delta):
	if Global.canMagnet:
		progress.value = spellTimer.time_left * 100 / spellTimer.wait_time
		timeNumber.text = str(round_place(spellTimer.time_left, 1))
		if canCast:
			if Input.is_action_just_pressed("Spell2"):
				var grapRange = grabArea.shape.radius
				grabArea.shape.set_radius(2000)
				spellTimer.start()
				timeNumber.visible = true
				canCast = false
				await get_tree().create_timer(5).timeout
				grabArea.shape.set_radius(grapRange)
	else :
		progress.value = 100

func _on_timer_timeout():
	canCast = true
	timeNumber.visible = false
	
	
func round_place(num,places):
	return (round(num*pow(10,places))/pow(10,places))
