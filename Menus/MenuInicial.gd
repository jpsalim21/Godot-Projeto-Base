extends Node

#Código do menu inicial

@onready var menu_inicial: Control = $"../MenuInicial"
@onready var opcoes: Control = $"../Opcoes"

func _ready() -> void:
	$"../Opcoes/VBoxContainer/GeralSlider".value = GameController.configuracoes.audioMaster
	$"../Opcoes/VBoxContainer/MusicaSlider".value = GameController.configuracoes.audioMusica
	$"../Opcoes/VBoxContainer/SFXSlider".value = GameController.configuracoes.audioSFX
	$"../Opcoes/VBoxContainer/Resolucao".selected = GameController.configuracoes.screen_index
	$"../MenuInicial/VBoxContainer/Start".grab_focus()

#Menu inicial
func _on_start_pressed() -> void:
	SceneController.changeSceneTo("res://DESCONSIDERAR/Teste.tscn", "CircleToon")

func _on_options_pressed() -> void:
	opcoes.visible = true
	menu_inicial.visible = false
	$"../Opcoes/VBoxContainer/Resolucao".grab_focus()

func _on_quit_pressed() -> void:
	GameController.fecharAplicacao()

#Menu Opcoes
func _on_voltar_pressed() -> void:
	opcoes.visible = false
	menu_inicial.visible = true
	$"../MenuInicial/VBoxContainer/Start".grab_focus()

func _on_resolucao_item_selected(index: int) -> void:
	GameController.configuracoes.screen_index = index

func _on_geral_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioMaster = value

func _on_musica_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioMusica = value

func _on_sfx_slider_value_changed(value: float) -> void:
	GameController.configuracoes.audioSFX = value
