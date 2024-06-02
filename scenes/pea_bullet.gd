class_name PeaBullet
extends Entity

func _on_dead(entity: Entity):
	queue_free()
