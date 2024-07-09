extends TextureRect

@onready var lblName = $Name
@onready var lblLvl = $Lvl
@onready var icon = $Icon

var mouse_over = false
var item = null
@onready var player = get_tree().get_first_node_in_group("Player")

signal selected_upgrade(upgrade)

func _ready():
	connect("selected_upgrade", Callable(player, "upgrade_chara"))
	if item == null:
		item = "food"
	lblName.text = UpgradeDb.UPGRADES[item]["displayname"]
	lblLvl.text = str(UpgradeDb.UPGRADES[item]["lvl"])
	icon.texture = load(UpgradeDb.UPGRADES[item]["icon"])

func _input(event):
	if event.is_action("Click"):
		if mouse_over:
			Global.clean = true
			Global.item = item
			$Pressed.play()


func _on_mouse_entered():
	mouse_over = true
	self.scale = Vector2(1.1, 1.1)
	$Selected.play()

func _on_mouse_exited():
	mouse_over = false
	self.scale = Vector2(1, 1)
