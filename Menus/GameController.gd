extends Node

# Singleton para gerenciar sistemas globais do jogo

var configuracoes: Configuracoes = null
var savePath: String = "user://save/"
var configFile: String = "Configuracao.tres"
var jaAbriu: bool = false

func _enter_tree() -> void:
	verify_save_directory(savePath)
	loadData(configFile)
	get_tree().set_auto_accept_quit(false)

# Verifica e cria o diretório de save, se necessário
func verify_save_directory(path: String) -> void:
	if not DirAccess.dir_exists_absolute(path):
		var err = DirAccess.make_dir_absolute(path)
		if err != OK:
			printerr("Erro ao criar diretório de save: ", err)

# Carrega as configurações salvas
func loadData(fileName: String) -> void:
	var filePath = savePath + fileName
	if not ResourceLoader.exists(filePath):
		printerr("Arquivo de configuração não encontrado. Criando novo...")
		configuracoes = Configuracoes.new()
		return
	configuracoes = ResourceLoader.load(filePath)
	DisplayServer.window_set_size(Configuracoes.resolucoes[configuracoes.screen_index])

# Salva as configurações
func saveData(fileName: String) -> void:
	var filePath = savePath + fileName
	var err = ResourceSaver.save(configuracoes, filePath)
	if err != OK:
		printerr("Erro ao salvar configurações: ", err)

# Fecha o aplicativo de forma segura
func fecharAplicacao() -> void:
	saveData(configFile)
	get_tree().quit()

# Trata o fechamento da janela
func _notification(what: int) -> void:
	if what == NOTIFICATION_WM_CLOSE_REQUEST:
		fecharAplicacao()
