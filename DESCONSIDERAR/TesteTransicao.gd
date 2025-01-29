extends Node2D

const MENU_INICIAL : PackedScene = preload("res://Menus/MenuInicial.tscn")

func _ready() -> void:
	SceneController.setPositionFocus(global_position)

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		SceneController.changeSceneTo(MENU_INICIAL, "CircleToon", "Fade")
