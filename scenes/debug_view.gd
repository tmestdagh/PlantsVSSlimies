# DebugView
extends Node2D

func _ready():
	setup_signals()
	
func setup_signals():
	EventBus.game_state_updated.connect(_on_game_state_updated)

func _on_game_state_updated(game_state):
	print("DebugView#game_state_updated %s" % game_state)
	var plants: int = 0
	var slimes: int  = 0
	
	if game_state.has("plant"):
		plants = int(game_state["plant"])
	else:
		plants = 0
	
	if game_state.has("slime"):
		slimes = int(game_state["slime"])
	else:
		slimes = 0
		
	$PlantCountLabel.text = "Plant \t %d" % plants
	$SlimeCountLabel.text = "Slime \t %d" % slimes
