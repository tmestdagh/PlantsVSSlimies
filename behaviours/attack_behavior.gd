class_name AttackBehavior
extends Node

@export var direction: int = -1
@export var bullet: PackedScene

@onready var host: Entity = get_node("../")
@onready var attack_timer: Timer = host.get_node("AttackTimer")

var is_attacking: bool = false

func _ready():
	print("%s loading AttackBehavior" % host)

func start_attack():
	print("%s#AttackBehavior starting attack" % host)
	attack()
	is_attacking = true
	attack_timer.start()

func attack():
	print("%s#AttackBehavior attack" % host)
	var _bullet = bullet.instantiate()
	_bullet.position = Vector2(host.position.x + 80, host.position.y + 30)
	host.get_parent().add_child(_bullet)
