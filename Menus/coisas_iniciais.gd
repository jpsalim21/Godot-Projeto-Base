extends Control

#Código para carregar as vinhetas inciais do jogo

func _ready() -> void:
	if GameController.jaAbriu:
		queue_free()
	GameController.jaAbriu = true

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
