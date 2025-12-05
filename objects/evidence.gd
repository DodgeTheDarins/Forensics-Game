extends Node2D

signal collected(item_name)

@export var item_name: String = "Evidence"


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and Input.is_action_just_pressed("pickup"):
		emit_signal("collected", item_name)
		queue_free() # removes the item
