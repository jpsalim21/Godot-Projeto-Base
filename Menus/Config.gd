extends Resource
class_name Configuracoes

#Resource responsável por guardar as informações de áudio e resolução do jogo

@export var audioMaster : float = 0:
	set(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
		audioMaster = value
@export var audioMusica : float = 0:
	set(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), value)
		audioMusica = value
@export var audioSFX : float = 0:
	set(value):
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)
		audioSFX = value

static var resolucoes = [
	Vector2i(1920, 1080),
	Vector2i(1600, 900),
	Vector2i(1280, 720),
	Vector2i(1024, 768),
]
@export var screen_index : int = 2:
	set(value):
		screen_index = value
		DisplayServer.window_set_size(resolucoes[value])
