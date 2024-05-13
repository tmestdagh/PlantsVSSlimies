class_name GridItem extends Control

@export var card: Card

signal selected

func _ready():
	print("GridItem#ready")
	var cards = get_cards()
	print("Cards %s" % cards)
	for c in get_children():
		print("GridItem#c %s" % c)

func _on_button_pressed():
	print("GridItem clicked")
	selected.emit(self)

func get_cards():
	find_children("","Card")
