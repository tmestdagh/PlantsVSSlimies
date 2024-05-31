class_name MovementBehavior
extends Node

@export var speed : int = 10
@export var direction: int = -1

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

func _physics_process(delta):
	if moving:
		move_delta(delta)
