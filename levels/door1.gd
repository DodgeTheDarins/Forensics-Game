extends Area2D
@onready var player_control: CharacterBody2D = $"player control"

var can = bool(false)
var isready = bool(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
	#if Input.is_action_just_pressed("pickup") and can and isready:
		#get_tree().change_scene_to_file("res://courtroom.tscn")


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("courtdoor"):
		can = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("courtdoor"):
		can = false
