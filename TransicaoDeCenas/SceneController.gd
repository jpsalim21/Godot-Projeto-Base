extends Node

func changeSceneTo(path : StringName):
	await Cortina.preencheTela(true)
	get_tree().change_scene_to_file(path)
	Cortina.preencheTela(false)

func reloadCurrentScene():
	await Cortina.preencheTela(true)
	get_tree().reload_current_scene()
	Cortina.preencheTela(false)
