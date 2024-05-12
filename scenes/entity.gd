class_name Entity extends Node2D

@export var health : int = 100

signal dead

func spawn():
	print("Entity#spawn %s" % self)

func _on_dead():
	print("I DIED %s" % self)
