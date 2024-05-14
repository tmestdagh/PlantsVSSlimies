class_name GridItem extends Control

@export var card: Card

signal selected

func _ready():
	print("GridItem#ready")
	
	if !card:
		#print("GridItem#card NOT found, trying to autoload")
		
		if get_child_count() > 0:
			for c in get_children():
				var _card := c as Card
				if _card:
					card = _card
					
	if card:				
		print("GridItem#Card %s" % card)

func _on_button_pressed():
	print("GridItem clicked")
	selected.emit(self)
