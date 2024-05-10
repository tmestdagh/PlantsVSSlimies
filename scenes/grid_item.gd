class_name GridItem extends Control

signal selected

#@onready var GridItem : Control = get_node(".")
@onready var card : Card = get_node("./Card")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	print("GridItem clicked")
	selected.emit(self)
