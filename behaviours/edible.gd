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
	var detect_only = area.get_meta("detect_only")
	print("%s#Edible#area_entered by %s #detect_only=%b" % [host, area, detect_only])

	if !detect_only:
		area.slime_behavior.eat.start_eating.connect(_on_being_eaten)
