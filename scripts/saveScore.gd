extends Node

const SAVEFILE = "user://score.save"

func _ready():
	load_score()

func save_score(score):
	var file = FileAccess.open(SAVEFILE, FileAccess.WRITE)
	if FileAccess.file_exists(SAVEFILE):
		file.store_32(score)
		file = null
	
func load_score():
	var file = FileAccess.open(SAVEFILE, FileAccess.READ)
	if FileAccess.file_exists(SAVEFILE):
		Global.record = file.get_32()
		
