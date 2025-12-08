extends Area2D

@onready var player := get_tree().get_nodes_in_group("player")[0]
@onready var light1: PointLight2D = $"../PointLight2D"
@onready var light2: PointLight2D = $"../PointLight2D2"


func _ready() -> void:
	visible


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		visible = false
		light1.visible = true
		light2.visible = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		visible = true
		light1.visible = false
		light2.visible = false
