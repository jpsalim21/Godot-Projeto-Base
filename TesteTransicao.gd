extends Node2D

#DESCONSIDERAR

func _ready() -> void:
	SceneController.setPositionFocus(global_position)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		SceneController.changeSceneTo("res://Menus/MenuInicial.tscn", "CircleToon", "Circle")
