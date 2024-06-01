class_name PeaShooter
extends Entity

@onready var attack_behavior: AttackBehavior = get_node("AttackBehavior")

func _on_slime_detect_area_2d_area_entered(area):
	$SlimeDetectArea2D.monitoring = false
	print("Monitoring %s" % $SlimeDetectArea2D.monitoring)
	if attack_behavior:
		if !attack_behavior.is_attacking:
			$AttackBehavior.start_attack()
	else:
		print("%s #attack_behavior=%s" % [self, attack_behavior])


func _on_slime_detect_timer_timeout():
	print("Timer timeout, enabling Monitoring")
	$SlimeDetectArea2D.monitoring = true
