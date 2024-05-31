class_name Entity extends Node2D

# TODO Woops, new func should have been made on PeaShooter script instead of entityt


@export var health : int = 100

signal dead

func spawn():
	print("Entity#spawn %s" % self)

func _on_dead():
	print("I DIED %s" % self)

func damage(amount: int = 10):
	health -= amount
	print("%s DMG %d #hp=%d" % [self, amount, health])
	if health <= 0:
		print("Entity DEAD")
		dead.emit()
	else:
		modulate.a = health/100.0
	
