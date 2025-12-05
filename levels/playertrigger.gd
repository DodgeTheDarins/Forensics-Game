extends Area2D
var dooropen1 = false
@onready var playerco := get_tree().get_nodes_in_group("player")[0]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position = playerco.global_position


func _on_door_1_body_entered(body: Node2D) -> void:
	dooropen1 = true
	print("dooropened")
func _on_door_1_body_exited(body: Node2D) -> void:
	dooropen1 = false
