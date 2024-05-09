extends "res://scenes/cell.gd"

signal plant_eaten

func _on_timer_timeout():
	print("SUN SHINE!!!!")
	EventBus.sunshine.emit()

func _on_ready():
	print("SUNFLOWER cost=%d cooldown=%d" % [cost, cooldown])
	if(cooldown > -1):
		$Timer.wait_time = 10
		$Timer.start()

func _on_area_2d_area_entered(area):
	# Subscribe to attacker's eating
	area.connect("eat", _on_attacked)

func _on_attacked(slime, bite_size):
	print("Being attacked by slime health=%d bite_size=%d" % [health, bite_size], slime)
	health -= bite_size
	# Change opacity to show the plant is being eaten
	modulate.a = health/100.0
	if health <= 0:
		print("Dead")
		plant_eaten.emit()
		queue_free()
