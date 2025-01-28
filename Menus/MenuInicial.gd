extends Node

# Controlador do menu inicial e menu de opções

@onready var menu_inicial: Control = $"../MenuInicial"
@onready var opcoes: Control = $"../Opcoes"

func _ready() -> void:
	# Inicializa os sliders e a seleção de resolução
	GameController.configuracoes.audioMaster = $"../Opcoes/VBoxContainer/GeralSlider".value
	GameController.configuracoes.audioMusica = $"../Opcoes/VBoxContainer/MusicaSlider".value
	GameController.configuracoes.audioSFX = $"../Opcoes/VBoxContainer/SFXSlider".value
	GameController.configuracoes.screen_index = $"../Opcoes/VBoxContainer/Resolucao".selected
	$"../MenuInicial/VBoxContainer/Start".grab_focus()

# Botão "Start"
func _on_start_pressed() -> void:
	SceneController.changeSceneTo("res://DESCONSIDERAR/Teste.tscn", "CircleToon")

# Botão "Options"
func _on_options_pressed() -> void:
	opcoes.visible = true
	menu_inicial.visible = false
	$"../Opcoes/VBoxContainer/Resolucao".grab_focus()

# Botão "Quit"
func _on_quit_pressed() -> void:
	GameController.fecharAplicacao()

# Botão "Voltar"
func _on_voltar_pressed() -> void:
	opcoes.visible = false
	menu_inicial.visible = true
	$"../MenuInicial/VBoxContainer/Start".grab_focus()

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
