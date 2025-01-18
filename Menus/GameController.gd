extends Node

#Singleton responsável por controlar alguns sistemas do jogo. 
#tipo salvamento das config, mudar resolução e controlar o fechamento do aplicativo

#ALERT SEMPRE QUE FOR FECHAR, FECHE O APLICATIVO POR AQUI. 

var configuracoes : Configuracoes = null
var savePath = "user://save/"
var configFile = "Configuracao.tres"

var jaAbriu = false

func _enter_tree() -> void:
	verify_save_directory(savePath)
	loadData(configFile)
	get_tree().set_auto_accept_quit(false)

#region SALVAR AS CONFIGURAÇÕES
'''
É comum que esse código dê alguns erros. Algumas coisas pra resolver:
	1. Delete o save. Vá no explorador, digite %APPDATA%, procure em godot>app_userdata>'nome do projeto'>save e delete
	2. Essas ações de load, save e make_dir_absolute retornam ERR. Peça para printar o retorno e veja o que está errado.
	3. Sai debugando aí. 
'''

func verify_save_directory(path : String):
	print(DirAccess.make_dir_absolute(path))

func loadData(fileName : String):
	if not ResourceLoader.exists(savePath + fileName):
		printerr("File does not exist")
		configuracoes = Configuracoes.new()
		return
	configuracoes = ResourceLoader.load(savePath + fileName)
	DisplayServer.window_set_size(Configuracoes.resolucoes[configuracoes.screen_index])

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
