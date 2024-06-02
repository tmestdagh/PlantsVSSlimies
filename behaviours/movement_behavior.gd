class_name MovementBehavior
extends Node

@export var speed : int = 10
@export var direction: int = -1

signal start_moving
signal stop_moving

var velocity: int = 0
var moving: bool = false

@onready var host = get_node("../")

func _ready():
	print("%s loading MovementBehavior" % get_parent())
	velocity = speed * direction
	moving = true

func move_delta(delta):
	move(delta * velocity)

func move(distance):
	#print("Slime moving ", distance)
	host.position.x += distance

func _start_moving():
	print("%s#%s#start_moving velocity=%d pos=%d" % [host, self, velocity, host.position.x])
	moving = true
	start_moving.emit()

func _stop_moving():
	print("%s#%s#stop_moving pos=%d" % [host, self, host.position.x])
	moving = false
	stop_moving.emit()

func _physics_process(delta):
	if moving:
		move_delta(delta)

