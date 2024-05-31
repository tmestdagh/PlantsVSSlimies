class_name AttackBehavior
extends Node

@export var direction: int = -1
@export var bullet: PackedScene
@export var cooldown: int = 1

@onready var host: Entity = get_node("../")
@onready var attack_timer: Timer = host.get_node("AttackTimer")

var is_attacking: bool = false

func _ready():
	#var attack_timer: Timer = host.get_node("AttackTimer")
	print("%s loading AttackBehavior" % host)
	#if attack_timer:
		#print("%s#AttackBehavior attack_timer#wait_time=" % [host, attack_timer.wait_time])
		#attack_timer.wait_time = cooldown
		#print("%s#AttackBehavior attack_timer#wait_time=" % [host, attack_timer.wait_time])
	#else:
		#print("%s#AttackBehavior no attack_timer found" % host)

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
