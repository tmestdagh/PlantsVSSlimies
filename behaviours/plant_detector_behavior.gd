class_name PlantDetectorBehavior
extends Node

@export var detection_area: Area2D

signal plant_detected(plant: Entity)

@onready var host: Entity = get_node("../")
var _detect_only: bool = true

func _ready():
	print("%s enabled on %s" % [self, host])
	detection_area.area_entered.connect(_on_detection_area_entered)
	plant_detected.connect(_on_plant_detected)

func _on_detection_area_entered(area: Area2D):
	var detect_only = area.get_meta("detect_only")
	print("%s detection_area entered by %s - detect_only=%s" % [host, area.get_parent(), detect_only])
	if !detect_only:
		plant_detected.emit(area.get_parent())

func _on_plant_detected(plant: Entity):
	print("%s#%s#on_plant_detected plant=%s" % [host, self, plant])
