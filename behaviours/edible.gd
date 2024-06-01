class_name Edible
extends Node

@onready var host: Entity = get_node("../")

func _ready():
	print("%s is Edible" % self.host)

func _on_being_eaten(slime: Entity, bite_size):
	print("Being eaten by slime health=%d bite_size=%d" % [host.health, bite_size])
	host.health -= bite_size
	## Change opacity to show the plant is being eaten
	host.modulate.a = host.health/100.0
	if host.health <= 0:
		print("Dead")
		host.dead.emit(host)
		host.plant_eaten.emit()
		host.queue_free()


func _on_area_entered(area):
	area.connect("eat", _on_being_eaten)
