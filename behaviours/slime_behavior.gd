class_name SlimeBehavior
extends Node

@onready var host: Entity = get_node("../")
@onready var movement: MovementBehavior = host.get_node("MovementBehavior")
@onready var eat: EatBehavior = host.get_node("EatBehavior")

func _ready():
	print("%s enabled on %s" % [self, host])

func _on_plant_detected(plant: Entity):
	print("%s#%s#plant_detected plant=%d" % [host, self, plant])
	movement._stop_moving()
	eat._start_eating(plant)
