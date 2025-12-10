extends Node2D

# grab the 8 sprite spots
@onready var spots := [
	$Spot1, $Spot2, $Spot3, $Spot4,
	$Spot5, $Spot6, $Spot7, $Spot8
]

# internal → visible name
var aliases := {
	"knife_clean": "knife",
	"knife_tampered": "knife",
	"knife_bloody": "knife",
	"gloves": "gloves",
	"blood": "blood",
	"fibre": "fibre"
}

# map visible names to textures
var textures := {
	"knife": preload("res://ui/knife_clean.png"),
	"fibre": preload("res://levels/bkvyrdhcar.png"),
	"gloves": preload("res://levels/download.jpg"),
	"blood": preload("res://ui/vialofblood.png"),
	"knife_tampered":preload("uid://dtbdugx1y42ov"),
	"knife_bloody": preload("uid://bawuxx2rqlaa8")}
	

func _ready():
	var inv = get_node("/root/inventory")
	inv.connect("item_added", Callable(self, "_refresh"))
	inv.connect("item_equipped", Callable(self, "_refresh"))
	inv.connect("item_unequipped", Callable(self, "_refresh"))
	_refresh()

func _refresh(_junk = null):
	var inv = get_node("/root/inventory")
	var items = inv.get_items()

	# Hide all spots
	for s in spots:
		s.visible = false

	var index := 0
	for internal_name in items:
		if index >= spots.size():
			break

		var spot: Node2D = spots[index]
		spot.visible = true

		# Pick texture based on internal name
		var sprite = spot.get_node("Sprite2D")

		match internal_name:
			"knife_clean":
				sprite.texture = preload("res://ui/knife_clean.png")
				sprite.scale = Vector2.ONE
			"knife_tampered":
				sprite.texture = preload("res://ui/knife_tampered.png")
				sprite.scale = Vector2.ONE
			"knife_bloody":
				sprite.texture = preload("res://ui/knife_bloody.png")
				sprite.scale = Vector2.ONE
			"blood":
				sprite.texture = preload("res://ui/vialofblood.png")
				sprite.scale = Vector2(0.35, 0.35)  # <<< SCALE DOWN BLOOD

		index += 1
