extends Control

signal selected

@onready var GridItem : Control = get_node(".")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("GridItem clicked")
	print("Current ", GridItem)
	if GridItem:
		print("Emitting selected")
		selected.emit(GridItem)
