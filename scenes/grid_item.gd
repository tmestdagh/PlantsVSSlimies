class_name GridItem extends Control

signal selected

#@onready var GridItem : Control = get_node(".")
@onready var card : Card = get_node("./Card")

func _on_button_pressed():
	print("GridItem clicked")
	selected.emit(self)
