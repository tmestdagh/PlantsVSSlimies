class_name EatBehavior
extends Node

@export var bite_size: int = 30
@export var chewing_timer: Timer

@onready var host: Entity = get_node("../")

signal start_eating(plant, bite_size)
signal stop_eating

var _plant: Entity

func _ready():
	print("%s#EatBehavior enabled" % host)

	# enforce timer settings
	if chewing_timer:
		print("%s#EatBehavior chewing_timer=%s" % [host, chewing_timer])
		chewing_timer.one_shot = false
		chewing_timer.autostart = false


func _start_eating(plant: Entity):
	_plant = plant
	_plant.dead.connect(_on_plant_dead)
	print("%s#EatBehavior started eating %s bite_size=%d" % [host, plant, bite_size])
	start_eating.emit(plant, bite_size)
	chewing_timer.start()

func _eat(plant: Entity):
	print("DEPRECATED %s#EatBehavior eating %s bite_size=%d" % [host, plant, bite_size])

func _bite():
	print("%s#EatBehavior bite %s bite_size=%d" % [host, _plant, bite_size])
	_plant.damage(bite_size)

func _on_plant_dead(plant: Entity):
	print("%s#%s#on_plant_dead plant=%s" % [host, self, plant])
	_stop_eating()

func _stop_eating():
	print("%s#%s#stop_eating plant=%s" % [host, self, _plant])
	_plant = null
	chewing_timer.stop()
	stop_eating.emit()
