class_name PeaBullet
extends Entity

signal deal_damage(entity: Entity)

func _ready():
	setup_signals()
	
func setup_signals():
	deal_damage.connect(_on_deal_damage)

func _on_area_entered(area):
	print("PeaBullet %s area entered by %s" % [self,area])
	deal_damage.emit(area)
	
func _on_deal_damage(slime: Slime):
	slime.damage()
	queue_free()
