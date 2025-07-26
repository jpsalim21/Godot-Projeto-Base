extends CanvasLayer

#Código para a cortina das transições. Normalmente, vc não vai precisar mexer aqui

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var circle_transition: ColorRect = $CircleTransition

var circleMaterial : ShaderMaterial

func _ready() -> void:
	circleMaterial = circle_transition.material
	get_viewport().size_changed.connect(windowResized)
	windowResized()

func preencheTela(booleano : bool, transicao : String = "Diamond"):
	if not animation.has_animation(transicao):
		printerr("NÃO HÁ ESSA ANIMAÇÃO. INSERIR ANIMAÇÃO CORRETA")
		return
	if booleano:
		animation.play(transicao)
	else:
		animation.play_backwards(transicao)
	await animation.animation_finished

func _setFocus(vetor : Vector2):
	circleMaterial.set_shader_parameter("endPoint", vetor)

func windowResized():
	var newSize = DisplayServer.window_get_size()
	print(newSize)
	circleMaterial.set_shader_parameter("screen_width", newSize.x)
	circleMaterial.set_shader_parameter("screen_height", newSize.y)
	print(circleMaterial.get_shader_parameter("screen_height"))
