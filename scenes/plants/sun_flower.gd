class_name SunFlower
extends Entity

signal plant_eaten
signal sunshine

func _ready():
	print("SUNFLOWER health=%d" % [health])
	$SolSpawnTimer.start()

func _on_sol_spawn_timer_timeout():
	print("SunFlower#SolSpawnTimer")
	sunshine.emit()
	EventBus.sunshine.emit()
