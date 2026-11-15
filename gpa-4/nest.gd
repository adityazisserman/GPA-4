extends CharacterBody2D

func _ready() -> void:
	$"../CanvasLayer/Label".visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.name == "boundingbox":
		$"../CanvasLayer/Label".visible = false
