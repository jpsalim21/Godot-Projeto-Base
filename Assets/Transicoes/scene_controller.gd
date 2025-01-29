extends Node

#Singleton que controla as cenas. Sempre que tiver algo relacionado a cenas
#vc deve chamar esse script

## Sempre que rode uma transição, reseta a posição do foco
var resetFocus := true

##Muda a cena para a cena de caminho [param path], com transição inicial [param animacao1] e transição final [param animacao2]
##Possíveis animacoes: [br][br]Diamond[br]Circle[br]CircleToon[br]Fade[br]
func changeSceneTo(path : StringName, animacao1 : String = "Diamond", animacao2: String = "Diamond"):
	await Cortina.preencheTela(true, animacao1)
	get_tree().change_scene_to_file(path)
	Cortina.preencheTela(false, animacao2)
	if resetFocus:
		Cortina._setFocus(Vector2(0.5, 0.5))

##Recarrega a cena atual, com a transicao inicial [param animacao1] e transição final [param animacao2]
func reloadCurrentScene(animacao1 : String = "Diamond", animacao2 : String = "Diamond"):
	await Cortina.preencheTela(true, animacao1)
	get_tree().reload_current_scene()
	Cortina.preencheTela(false, animacao2)
	if resetFocus:
		Cortina._setFocus(Vector2(0.5, 0.5))

##Recebe a [param pos] (global position) e coloca como foco da transição.
func setPositionFocus(pos : Vector2):
	var cam = get_viewport().get_camera_2d()
	
	var difPos = pos - cam.global_position
	var viewPort = get_viewport().get_visible_rect().size
	print(difPos, viewPort)
	var newPos : Vector2 = (pos - cam.global_position) * cam.zoom + viewPort / 2
	
	var screenSize = DisplayServer.screen_get_size()
	var uvPos : Vector2 = Vector2(newPos.x / viewPort.x, newPos.y / viewPort.y)
	print(newPos, screenSize, uvPos)
	Cortina._setFocus(uvPos)
