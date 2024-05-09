extends Button

signal start_game

func _on_pressed():
	start_game.emit()

func _on_start_game():
	print("START GAME")
	
