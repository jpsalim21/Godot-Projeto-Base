extends Node

func changeSceneTo(path : StringName, animacao1 : String = "Diamond", animacao2: String = "Diamond"):
	await Cortina.preencheTela(true, animacao1)
	get_tree().change_scene_to_file(path)
	Cortina.preencheTela(false, animacao2)

func reloadCurrentScene():
	await Cortina.preencheTela(true)
	get_tree().reload_current_scene()
	Cortina.preencheTela(false)
