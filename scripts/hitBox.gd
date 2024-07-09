extends Area2D

@export var damage = 1
@onready var collission = $CollisionShape2D
@onready var disableTimer = $DisableHitBoxTimer

func tempdisabled():
	collission.call_deferred("set", "disabled", true)
	disableTimer.start()


func _on_disable_hit_box_timer_timeout():
	collission.call_deferred("set", "disabled", false)
