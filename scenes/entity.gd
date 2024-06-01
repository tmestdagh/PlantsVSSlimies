class_name Entity extends Node2D

@export var health : int = 100

signal dead(entity: Entity)

func spawn():
	print("Entity#spawn %s" % self)

func _on_dead(entity: Entity):
	print("Entity#on_dead entity=%s" % entity)

func damage(amount: int = 60):
	health -= amount
	print("%s DMG %d #hp=%d" % [self, amount, health])
	if health <= 0:
		print("Entity %s DEAD" % self)
		dead.emit(self)
	else:
		modulate.a = health/100.0

