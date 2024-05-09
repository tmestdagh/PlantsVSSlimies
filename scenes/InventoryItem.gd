extends Control

signal pressed

@export var cellPackedScene: PackedScene

var instance = null

func _on_button_pressed():
	print("InventoryItem#button_pressed", cellPackedScene)
	pressed.emit(instance)

func _ready():
	print("InventoryItem#ready", cellPackedScene)
	instance = cellPackedScene.instantiate()
	if instance:
		instance.set('cooldown', -1)
		$Container.add_child(instance)
