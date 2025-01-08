extends CanvasLayer

@export var cortina : ColorRect

func preencheTela(booleano : bool):
	var tween = create_tween()
	if booleano:
		tween.tween_property(cortina, "material:shader_parameter/progress", 1, 1.0)
	else:
		tween.tween_property(cortina, "material:shader_parameter/progress", 0, 1.0)
