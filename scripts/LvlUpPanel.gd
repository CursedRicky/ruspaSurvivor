extends TextureRect

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.clean:
		$"../..".upgrade_chara(Global.item)
