extends CanvasLayer

func change_scene(target) :
	$AnimationTree.play("dissolve")
	await $AnimationTree.animation_finished
	get_tree().change_scene_to_file(target)
	$AnimationTree.play_backwards("dissolve")

func reload_scene():
	$AnimationTree.play("dissolve")
	await $AnimationTree.animation_finished
	get_tree().reload_current_scene()
	$AnimationTree.play_backwards("dissolve")
