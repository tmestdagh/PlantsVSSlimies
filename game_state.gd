class_name GameState
extends Node

var state : Dictionary

const SLIME: String = "slime"
const PLANT: String = "plant"

var plant_count: int = 0
var slime_count: int = 0

func _ready():
	print("GameState %s" % state)
	state[SLIME] = 0
	state[PLANT] = 0
	print("GameState %s" % state)
	
func add(entity_type):
	match entity_type.to_lower():
		SLIME:
			add_slime()
		PLANT:
			add_plant()
		_:
			print("EntityType %s not found, could not add to game_state" % entity_type)
	
	print("GameState %s" % state)
	EventBus.game_state_updated.emit(self)

func add_slime():
	slime_count += 1
	state[SLIME] = slime_count

func add_plant():
	plant_count += 1
	state[PLANT] = plant_count
	
func slimes():
	return state[SLIME]
	
func plants():
	return state[PLANT]
