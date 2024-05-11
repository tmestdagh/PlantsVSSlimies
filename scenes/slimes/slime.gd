class_name Slime
extends Entity

@export var speed : int = 10
@export var direction: int = -1
@export var bite_size: int = 30

var velocity : int = 0
var moving : bool = false
var plant

signal plant_detected(plant: Cell)
signal eat(plant, bite_size)

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = speed * direction
	moving = true
	
#func setup_signals():
	#print("Slime#setup_signals")
	#plant_detected.connect(_on_plant_detected)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if moving:
		move(delta * velocity)

func move(distance):
	#print("Slime moving ", distance)
	position.x += distance

func _on_area_entered(area):
	plant_detected.emit(area.get_parent())
	
func _on_plant_detected(plant: Cell):
	print("Slime#on_plant_detected %s" % plant)
	stop_moving_and_start_eating(plant)
	
func stop_moving_and_start_eating(_plant: Cell):
	plant = _plant
	print("Slime#stop_moving_and_start_eating %s" % plant)
	# stop
	moving = false
	# subscribe to plant health
	plant.connect("plant_eaten", _on_plant_eaten)
	# start eating the plant
	$EatingPace.start()
	
func _on_plant_eaten():
	print("Plant has been eaten ")
	plant = null
	$EatingPace.stop()
	# start moving again
	moving = true

func _on_eating_pace_timeout():	
	if plant:
		print("Eating plant ", plant)
		if is_instance_valid(plant):
			eat.emit(plant, bite_size)
		else:
			# Stop eating as the plant is gone
			_on_plant_eaten()
