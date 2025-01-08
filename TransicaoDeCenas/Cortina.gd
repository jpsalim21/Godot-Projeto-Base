extends CanvasLayer

@onready var animation: AnimationPlayer = $AnimationPlayer

func preencheTela(booleano : bool, transicao : String = "Diamond"):
	if not animation.has_animation(transicao):
		printerr("NÃO HÁ ESSA ANIMAÇÃO. INSERIR ANIMAÇÃO CORRETA")
		return
	if booleano:
		animation.play(transicao)
	else:
		animation.play_backwards(transicao)
	await animation.animation_finished
