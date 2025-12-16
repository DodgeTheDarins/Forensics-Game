extends Area2D

@export var serum_id := ""   # "A", "B", or "Rh"
var activated := false

func _ready():
	print("Serum", serum_id, "ready.")

func activate():
	if activated:
		print("Serum", serum_id, "already activated")
		return

	activated = true

	# O Rh- never reacts, so always "negative"
	modulate = Color(0, 0, 1)  # blue = no reaction
	print("Serum", serum_id, "tested. No reaction (negative).")
