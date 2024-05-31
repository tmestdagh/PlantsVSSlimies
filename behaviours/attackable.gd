class_name Attackable
extends Node

@onready var host: Entity = get_node("../")

func _ready():
	print("%s is Attackable" % self.host)

func _on_attacked():
	host.health -= 40
