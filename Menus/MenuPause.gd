extends Control

#Código do menu de pause. Automaticamente pausa a cena quando é iniciado, ou seja, tudo fica parado

func _ready() -> void:
	$VBoxContainer/Resolucao.selected = GameController.configuracoes.screen_index
	$VBoxContainer/GeralSlider.value = GameController.configuracoes.audioMaster
	$VBoxContainer/MusicaSlider.value = GameController.configuracoes.audioMusica
	$VBoxContainer/SFXSlider.value = GameController.configuracoes.audioSFX

func _on_panel_visibility_changed() -> void:
	if visible:
		$VBoxContainer/Resolucao.grab_focus()
	get_tree().paused = visible

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		visible = !visible

func _on_resolucao_item_selected(index: int) -> void:
	GameController.configuracoes.screen_index = index

func _on_geral_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioMaster = value

func _on_musica_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioMusica = value

func _on_sfx_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioSFX = value

func _on_voltar_pressed() -> void:
	visible = false

func _on_sair_pressed() -> void:
	visible = false
	get_tree().paused = false
	SceneController.changeSceneTo("res://Menus/MenuInicial.tscn")
	pass # Replace with function body.
