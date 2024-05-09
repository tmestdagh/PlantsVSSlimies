extends Area2D

signal target_reached

func _on_area_entered(area):
	print("Target#area_entered by %s" % area)
	target_reached.emit(area)

func _on_target_reached(_slime: Slime):
	print("Target reached by slime %s" % _slime)
	EventBus.gameover.emit()
