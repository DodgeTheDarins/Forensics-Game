extends Node2D

signal collected(item_name)
var in_evidence
@export var item_name: String = "Evidence"


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("player"):
		in_evidence = true
	
func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("pickup") and in_evidence:
		emit_signal("collected", item_name)
		print("blood")


func _on_area_2d_body_exited(body: Node2D) -> void:
	in_evidence = false
