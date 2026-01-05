extends Node2D

var in_evidence

func _physics_process(_delta):
	
	if inventory.has_item("dishes"):
		queue_free()
	if Input.is_action_pressed("pickup") and in_evidence and inventory.equipped_item == "gloves":
		inventory.add_item("dishes")
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_evidence = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		in_evidence = false
