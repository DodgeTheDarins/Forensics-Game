extends Node2D

@onready var hint_text: Label = $UI/HintText
@onready var finish_button: Button = $UI/FinishButton
@onready var blood_sample: Node2D = $BloodSample

var gobak
var reactions_done := 0
const TOTAL_REACTIONS := 3

func _ready():

	# UI
	hint_text.text = "Drag the blood sample into each serum. Once complete, look at any reactions and press finish" 
	finish_button.disabled = true
	finish_button.hide()
	finish_button.pressed.connect(_on_finish_button_pressed)

	# Consume blood item
	if inventory.has_item("blood"):
		inventory.remove_item("blood")
	else:
		print("No blood sample in inventory! Closing test.")
		queue_free()

func register_reaction():
	reactions_done += 1
	print(reactions_done)
	if reactions_done >= TOTAL_REACTIONS:
		hint_text.text = "All reactions observed!"
		finish_button.disabled = false
		finish_button.show()

func _on_finish_button_pressed() -> void:
	print("Blood typing test finished!")
	# Optional: add a report item to inventory
	# Inventory.add_item("blood_report", "res://icons/blood_report.png")
	gobak = true

func _process(_delta: float) -> void:
	if gobak == true:
		get_tree().change_scene_to_file("res://levels/Level2_Lab.tscn")
	if Input.is_action_just_pressed("gobackmainpls"):
		gobak = true


func _on_area_2d_4_registered() -> void:
	register_reaction()


func _on_area_2d_3_registered() -> void:
	register_reaction()


func _on_area_2d_2_registered() -> void:
	register_reaction()
	print("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")
