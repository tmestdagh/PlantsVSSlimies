class_name DealDamageBehavior
extends Node

signal deal_damage(entity: Entity)

@export var damage: int = 20

@onready var host: Entity = get_node("../")

func _ready():
	print("%s#DealDamageBehavior loaded" % host)
	deal_damage.connect(_on_deal_damage)

func _deal_damage(entity: Entity):
	print("%s#deal_damage to %s -%d HP" % [host, entity, damage])
	deal_damage.emit(entity)

func _on_deal_damage(slime: Slime):
	slime.damage()
