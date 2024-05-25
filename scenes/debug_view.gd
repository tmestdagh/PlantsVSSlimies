# DebugView
extends Node2D

func _ready():
	setup_signals()
	
func setup_signals():
	EventBus.game_state_updated.connect(_on_game_state_updated)

func _on_game_state_updated(game_state: GameState):
	print("DebugView#game_state_updated %s" % game_state)
		
	$ReferenceRect/PlantCountLabel.text = "Plant \t %d" % game_state.plant_count
	$ReferenceRect/SlimeCountLabel.text = "Slime \t %d" % game_state.slime_count
