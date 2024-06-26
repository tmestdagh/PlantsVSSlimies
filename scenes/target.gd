extends Area2D

signal target_reached(slime: Slime)

func _on_area_entered(area):
	#print("Target#area_entered by %s" % area)
	target_reached.emit(area)

func _on_target_reached(slime: Slime):
	print("Target reached by slime %s" % slime)
	EventBus.gameover.emit()
