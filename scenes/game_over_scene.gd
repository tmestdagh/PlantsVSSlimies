extends Control

func _ready():
	$TryAgainButton.hide()

func retry():
	print("GameOverSene#retry")
	EventBus.retry.emit()
	queue_free()


func _on_timer_timeout():
	$TryAgainButton.show()
