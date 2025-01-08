extends Node

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
	SceneController.changeSceneTo("Teste.tscn", "CircleToon")

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

var resolucoes = [
	Vector2i(1920, 1080),
	Vector2i(1600, 900),
	Vector2i(1280, 720),
	Vector2i(1024, 768),
]

func _on_resolucao_item_selected(index: int) -> void:
	DisplayServer.window_set_size(resolucoes[index])
	GameController.configuracoes.screen_size = resolucoes[index]
	GameController.configuracoes.screen_index = index

func _on_geral_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
	GameController.configuracoes.audioMaster = value

func _on_musica_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), value)
	GameController.configuracoes.audioMusica = value

func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
	GameController.configuracoes.audioSFX = value
