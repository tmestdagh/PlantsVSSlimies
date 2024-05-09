class_name Inventory extends Node

var currentCard: Card

signal card_selected(card: Card)

func _on_card_pressed(card: Card):
	print("Inventory#card_pressed %s" % card)
	card_selected.emit(card)


func _on_card_selected(card: Card):
	print("Inventory#card_selected %s plant=%s" % [card, card.plant])
	currentCard = card
