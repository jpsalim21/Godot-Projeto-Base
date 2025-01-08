extends Node

var configuracoes : Configuracoes = null
var savePath = "user://save/"
var configFile = "Configuracao.tres"

func _enter_tree() -> void:
	verify_save_directory(savePath)
	loadData(configFile)
	get_tree().set_auto_accept_quit(false)
	DisplayServer.window_set_size(configuracoes.screen_size)

#region SALVAR AS CONFIGURAÇÕES
func verify_save_directory(path : String):
	DirAccess.make_dir_absolute(path)

func loadData(fileName : String):
	if not ResourceLoader.exists(savePath + fileName):
		printerr("File does not exist")
		configuracoes = Configuracoes.new()
		return
	configuracoes = ResourceLoader.load(savePath + fileName)

func saveData(fileName : String):
	print(ResourceSaver.save(configuracoes, savePath + fileName))
#endregion

func fecharAplicacao():
	saveData(configFile)
	get_tree().quit()

func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		saveData(configFile)
		get_tree().quit()
