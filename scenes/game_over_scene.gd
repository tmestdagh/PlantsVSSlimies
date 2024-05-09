extends Control

func retry():
	print("GameOverSene#retry")
	EventBus.retry.emit()
	queue_free()
