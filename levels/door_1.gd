extends Area2D

@onready var player: Node2D = $"../../Player"
@onready var playertrigger: Area2D = $"../../playertrigger"

@onready var playerco := get_tree().get_nodes_in_group("player")[0]


func _ready() -> void:
	pass

func _process(delta: float) -> void:
	if playertrigger.dooropen1 == true:
		if playerco.velocity.x < 0.0:
			scale.x = -2.0
		else:
			scale.x = 2.0
	else:
		scale.x = 1.0
