extends Resource
class_name Configuracoes

#Resource responsável por guardar as informações de áudio e resolução do jogo

@export_range(-80, 24) var audioMaster : float = 0:
	set(value):
		audioMaster = clamp(value, -80, 24)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)
@export_range(-80, 24) var audioMusica : float = 0:
	set(value):
		audioMusica = clamp(value, -80, 24)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Musica"), value)
@export_range(-80, 24) var audioSFX : float = 0:
	set(value):
		audioSFX = clamp(value, -80, 24)
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)

static var resolucoes = [
	Vector2i(1920, 1080), # Full HD
	Vector2i(1600, 900), # HD+
	Vector2i(1280, 720), # HD
	Vector2i(1024, 768), # Padrão 
]

signal screenResized()

@export_range(0, 3) var screen_index : int = 2:
	set(value):
		screen_index = value
		DisplayServer.window_set_size(resolucoes[value])
