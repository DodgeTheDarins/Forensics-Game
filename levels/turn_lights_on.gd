extends Area2D
@onready var light_right: PointLight2D = $"../light_right"
@onready var light_left: PointLight2D = $"../light_left"
@onready var light_middle: PointLight2D = $"../light_middle"
var timer = 2.0
var lights_on = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	light_left.modulate = Color(1.0,1.0,1.0,0.0) # Replace with function body.
	light_right.modulate = Color(1.0,1.0,1.0,0.0)
	light_middle.modulate = Color(1.0,1.0,1.0,0.0)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if lights_on:
		timer -= delta
	timer = clampf(timer, 0.0, 2.0)
	if timer == 0.0:
		light_left.modulate = lerp(light_left.modulate, Color(1.0,1.0,1.0,1.0), delta)
		light_middle.modulate = lerp(light_middle.modulate, Color(1.0,1.0,1.0,1.0), delta)
		light_right.modulate = lerp(light_right.modulate, Color(1.0,1.0,1.0,1.0), delta)
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		lights_on = true
		timer = 2.0
