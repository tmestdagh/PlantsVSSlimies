class_name SunFlower
extends Entity

signal plant_eaten

func _on_ready():
	print("SUNFLOWER health=%d" % [health])

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
