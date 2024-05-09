extends "res://scenes/cell.gd"

signal slime_spawn

func _on_timer_ready():
	print("BasicSlime cost=%d cooldown=%d" % [cost, cooldown])
	if(cooldown > -1):
		$Timer.wait_time = cooldown
		$Timer.start()


func _on_timer_timeout():
	print("SLIME SPAWN ")
	EventBus.emit_signal("spawn_slime", global_position)
	queue_free()
