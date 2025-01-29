extends Control

# Controlador do menu de pausa

func _ready() -> void:
	# Inicializa os sliders e a seleção de resolução
	$VBoxContainer/Resolucao.selected = GameController.configuracoes.screen_index
	$VBoxContainer/GeralSlider.value = GameController.configuracoes.audioMaster
	$VBoxContainer/MusicaSlider.value = GameController.configuracoes.audioMusica
	$VBoxContainer/SFXSlider.value = GameController.configuracoes.audioSFX

# Atualiza a visibilidade e o estado de pausa
func _on_panel_visibility_changed() -> void:
	if visible:
		$VBoxContainer/Resolucao.grab_focus()
	get_tree().paused = visible

# Trata a entrada para abrir/fechar o menu de pausa
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = !visible

# Seleção de resolução
func _on_resolucao_item_selected(index: int) -> void:
	GameController.configuracoes.screen_index = index

# Sliders de volume
func _on_geral_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioMaster = value

func _on_musica_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioMusica = value

func _on_sfx_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioSFX = value

# Botão "Voltar"
func _on_voltar_pressed() -> void:
	visible = false

# Botão "Sair"
func _on_sair_pressed() -> void:
	visible = false
	get_tree().paused = false
	SceneController.changeSceneTo("res://Assets/Menus/menu_inicial.tscn")
