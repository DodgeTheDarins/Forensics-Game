extends Area2D
@onready var playertrigger: Area2D = $"../../playertrigger"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if playertrigger.building1open == true:
		visible = false
	else:
		visible = true
