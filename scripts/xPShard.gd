extends Area2D

@onready var sprite = $Sprite2D
@onready var collision = $CollisionShape2D
@export var exp = 1

var syrenBlue = preload("res://art/Sirens/sirenB.png")
var syrenGreen = preload("res://art/Sirens/sirenG.png")
var syrenYellow = preload("res://art/Sirens/sirenY.png")
var syrenRed = preload("res://art/Sirens/sirenR.png")

var target = null
var speed = -1

func _ready():
	animate()
	if exp < 5:
		return
	elif exp < 25:
		sprite.texture = syrenYellow
	elif exp < 50:
		sprite.texture = syrenGreen
	else :
		sprite.texture = syrenBlue
	

func animate():
	var tween = get_tree().create_tween()
	var yPos = sprite.position.y
	tween.set_parallel(false)
	tween.tween_property(sprite, "position:y", yPos - 4, 1)
	tween.tween_property(sprite, "position:y", yPos, 1)
	tween.tween_interval(2)
	await get_tree().create_timer(1).timeout


func _on_timer_timeout():
	animate()

func _physics_process(delta):
	if target != null:
		global_position = global_position.move_toward(target.global_position, speed)
		speed += 2*delta
		
func collect():
	collision.call_deferred("set", "disabled", true)
	sprite.visible = false
	$Sprite2D2.visible = false
	_on_killer_timeout()
	return exp



func _on_killer_timeout():
	await get_tree().create_timer(.1).timeout
	queue_free()
