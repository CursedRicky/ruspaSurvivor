extends Node2D

var d := 0.0
var d2 := 10.0
var d3 := 20.0
var d4 := 30.0
var d5 := 40.0
@onready var cone1 = $Cone1
@onready var cone2 = $Cone2
@onready var cone3 = $Cone3
@onready var cone4 = $Cone4
@onready var cone5 = $Cone5
@export var radius := 50
@export var speed := 2.0
@export var player: Player

# Called when the node enters the scene tree for the first time.
func _ready():
	cone1.visible = false
	$Cone1/hitBox/CollisionShape2D.disabled = true
	cone2.visible = false
	$Cone2/hitBox/CollisionShape2D.disabled = true
	cone3.visible = false
	$Cone3/hitBox/CollisionShape2D.disabled = true
	cone4.visible = false
	$Cone4/hitBox/CollisionShape2D.disabled = true
	cone5.visible = false
	$Cone5/hitBox/CollisionShape2D.disabled = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var randDamage = randi_range(1, (20 + Global.damageUp) * 1.2)
	d += delta
	d2 += delta
	d3 += delta
	d4 += delta
	d5 += delta
	if Global.coneCount > 0:
		cone1.visible = true
		$Cone1/hitBox.damage = (20+randDamage)
		$Cone1/hitBox/CollisionShape2D.disabled = false
		cone1.position = Vector2(
			sin(d * speed) * radius,
			cos(d * speed) * radius
		)
		cone1.rotation = d
	
	if Global.coneCount > 1:
		cone2.visible = true
		$Cone2/hitBox.damage = (20+randDamage)
		$Cone2/hitBox/CollisionShape2D.disabled = false
		cone2.position = Vector2(
			sin(d2 * speed) * radius,
			cos(d2 * speed) * radius
		)
		cone2.rotation = d2
		
	if Global.coneCount > 2:
		cone3.visible = true
		$Cone3/hitBox.damage = (20+randDamage)
		$Cone3/hitBox/CollisionShape2D.disabled = false
		cone3.position = Vector2(
			sin(d3 * speed) * radius,
			cos(d3 * speed) * radius
		)
		cone3.rotation = d3
	
	if Global.coneCount > 3:
		cone4.visible = true
		$Cone4/hitBox.damage = (20+randDamage)
		$Cone4/hitBox/CollisionShape2D.disabled = false
		cone4.position = Vector2(
			sin(d4 * speed) * radius,
			cos(d4 * speed) * radius
		)
		cone4.rotation = d4
		
	if Global.coneCount > 4:
		cone5.visible = true
		$Cone5/hitBox/CollisionShape2D.disabled = false
		$Cone5/hitBox.damage = (20+randDamage)
		cone5.position = Vector2(
			sin(d5 * speed) * radius,
			cos(d5 * speed) * radius
		)
		cone5.rotation = d5
