class_name Level
extends CanvasLayer

# TODO	Rename HUD to Level

func show_message(text):
	$HUD/MessageLabel.text = text
	$HUD/MessageLabel.show()
	$HUD/MessageTimer.start()

func _ready():
	print("Loading HUD")
	# Hide everything except the start button
	Utils.disable_and_hide_node($HUD)
	Utils.disable_and_hide_node($GridMap)
	Utils.disable_and_hide_node($Inventory)
	Utils.disable_and_hide_node(($WaveController))
	Utils.disable_and_hide_node($HUD/DebugView)
	$HUD/ScoreContainer.setValue(Gameplay.currentSols)
	# Connect the EventBus signals
	EventBus.connect("gameover", _on_gameover)
	EventBus.connect("spawn_slime", _on_slime_spawn)
	EventBus.sols_update.connect(_on_sols_update)

func load():
	print("Level loading ...")
	Utils.enable_and_show_node($HUD)

func _on_start_button_start_game():
	print("signal -> start_game -> HUD")
	show_message("Yiiiiihaaaa")
	$HUD/StartButton.hide()
	Utils.enable_and_show_node($GridMap)
	Utils.enable_and_show_node($Inventory)
	Utils.enable_and_show_node(($WaveController))
	Utils.enable_and_show_node($HUD/DebugView)
	$WaveController.start()

func _on_message_timer_timeout():
	$HUD/MessageLabel.hide()

func _on_inventory_item_select(type):
	Gameplay.currentInventoryItem = type

func _on_grid_map_grid_item_action(grid_item):
	print("HUD#_on_grid_map_grid_item_action ", grid_item)
	EventBus.grid_item_selected.emit(grid_item)

func _on_sols_update(_sols):
	print("HUD#on_sols_update %d" % _sols)
	$HUD/ScoreContainer.setValue(_sols)

func _on_slime_spawn(_position):
	print("HUD#on_slime_spawn")
	print("position ", _position)
	var Slime = load("res://scenes/slimes/slime.tscn")
	var slime = Slime.instantiate()
	slime.position = _position
	add_child(slime)

func _on_gameover():
	print("GAME OVER")
	show_message("GAME OVER")
	queue_free()

func _on_new_inventory_card_selected(card: Card):
	print("HUD#inventory_card_selected %s" % card.plant)
	EventBus.plant_selected.emit(card.plant)
	EventBus.inventory_card_selected.emit(card)

func _on_wave_started(wave):
	print("HUD#Wave %s started" % wave)

func _on_wave_ended(wave: Wave):
	print("HUD#Wave Ended %s" % wave)

