class_name MovementBehavior
extends Node

@export var speed : int = 10
@export var direction: int = -1

var velocity: int = 0 
@onready var host : Entity = get_node("../")

func _ready():
	print("%s loading MovementBehavior" % get_parent())
	velocity = speed * direction
	
func _physics_process(delta):
	if host.moving:
		move(delta * velocity)
		
func move(distance):
	#print("Slime moving ", distance)
	host.position.x += distance
