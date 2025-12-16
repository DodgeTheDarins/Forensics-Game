extends Area2D

var dragging := false
var drag_offset := Vector2.ZERO
var used_serums := []

func _ready():
	input_pickable = true
	monitoring = true
	print("BloodSample ready")

func _input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			dragging = true
			drag_offset = global_position - event.position
			print("Drag start at ", global_position)

func _input(event):
	if dragging and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and not event.pressed:
			dragging = false
			print("Drag stop at ", global_position)
			check_serum_drop()

func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() + drag_offset

# ----------------------------
# SERUM DETECTION FUNCTION
# ----------------------------
func check_serum_drop():
	print("Checking for serum overlaps...")
	var areas = get_overlapping_areas()

	if areas.is_empty():
		print("No areas detected under blood.")
		return

	for area in areas:
		print("Found overlapping area:", area.name, "class:", area.get_class())

		# Check for serum_id property instead of metadata
		if "serum_id" in area and area.has_method("activate"):
			var serum_id = area.serum_id
			if serum_id in used_serums:
				print("Serum", serum_id, "already used, skipping.")
				continue

			print("Blood dropped on serum:", serum_id)
			used_serums.append(serum_id)
			area.activate()
		else:
			print("Overlapping area has no activate() or serum_id:", area)
