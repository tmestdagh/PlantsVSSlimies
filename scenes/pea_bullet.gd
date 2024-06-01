class_name PeaBullet
extends Entity

func _on_area_entered(area):
	print("PeaBullet %s area entered by %s" % [self,area])
	#deal_damage_behavior.deal_damage.emit(area)

func _on_deal_damage(slime: Slime):
	queue_free()
