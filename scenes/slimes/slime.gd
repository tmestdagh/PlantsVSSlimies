class_name Slime
extends Entity

@onready var slime_behavior: SlimeBehavior = get_node("SlimeBehavior")

func _on_dead(entity: Entity):
	print("Slime#on_dead entity=%s" % entity)
	queue_free()
