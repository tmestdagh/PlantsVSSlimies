class_name Card extends TextureButton

@export var plant: Cell

signal card_pressed(card: Card)

func _ready():
	print("Card#ready cell=%s" % plant)
	print(get_children(false))
	
	if !plant:
		plant = get_plant()
	
	#TODO Auto resize the cell
	if plant:
		# Do not show the Plant Cell
		plant.hide()
		# Use the plant cells texture as texture for the button
		
		print("Plant %s size=%s" % [plant, plant.size])
		plant.size = Vector2(50, 50)
		print("Plant %s resized to %s" % [plant, plant.size])

func get_plant():
	var _children = find_children("","Cell")
	return _children[0]


func _on_pressed():
	card_pressed.emit(self)
