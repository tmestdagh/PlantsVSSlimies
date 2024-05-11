extends Node

var currentSols : int = 50
var currentInventoryItem : Object
var current_card: Card

const Sol : Resource = preload("res://scenes/sol.tscn")
const SlimeScene : Resource = preload("res://scenes/slimes/slime.tscn")
const SunFlowerScene : Resource = preload("res://scenes/sun_flower.tscn")

func _ready():
	print("Gameplay is ready to start")
	setup_signals()
	
func setup_signals():
	print("Gameplay#setup_signals")
	EventBus.gameover.connect(_on_gameover)
	EventBus.sunshine.connect(_on_sun_flower_sunshine)
	EventBus.retry.connect(_on_retry)
	EventBus.grid_item_selected.connect(_on_grid_item_selected)
	EventBus.sale.connect(_on_sale)
	EventBus.plant.connect(_on_plant)
	EventBus.plant_selected.connect(_on_plant_selected)
	EventBus.spawn_entity.connect(_on_spawn_entity)
	EventBus.inventory_card_selected.connect(_on_inventory_card_selected)
	EventBus.play_card.connect(_on_play_card)
	
func _on_inventory_card_selected(card: Card):
	print("Gameplay#on_inventory_card_selected %s" % card)	
	current_card = card
	
func _on_spawn_entity(card: Card):
	var entity = card.entity.instantiate()
	print("Gameplay#on_spawn_entity %s" % entity)
	entity.position = card.global_position
	entity.z_index = 10
	add_child(entity)
	print("Entity %s added hp=%d" % [entity, entity.health])
	
#func _on_spawn_entity(card: Card):
	#print("Gameplay#on_spawn_entity %s" % card)
	#var slime = SlimeScene.instantiate()
	##var slime: Cell = card.plant.duplicate()
	#slime.position = card.global_position
	#slime.z_index = 10
	#print(slime)
	#add_child(slime)
	##slime.show()
	#print("Entity %s added" % card.plant)
	
func _on_plant_selected(plant: Cell):
	print("Gameplay#on_plant_selected %s" % plant)
	currentInventoryItem = plant
	
func _on_sun_flower_sunshine():
	print("Gameplay#Sunshine")
	var sol = Sol.instantiate()
	sol.sol_pickup.connect(_on_sol_pickup)
	sol.set_position(Vector2(randi_range(100, 500), randi_range(100, 500)))
	add_child(sol)

func _on_sol_pickup(sol):
	print("Gameplay#sol pickup ", sol)
	updateCurrentSols(sol.sols)
	print("Gameplay#sols updated sols=%d" % sol.sols)
	sol.queue_free()
	
func _on_grid_item_selected(grid_item):
	print("Gameplay#grid_item_selected %s" % grid_item)
	if currentInventoryItem:
		print("Current InventoryItem ", currentInventoryItem)
		
		if buy(currentInventoryItem):
			EventBus.plant.emit(grid_item, currentInventoryItem)
			print("Planted yoooo %s" % grid_item)
			
	if current_card:
		print("Current Card %s" % current_card)
		
		if buy(current_card):
			EventBus.play_card.emit(current_card, grid_item)

func _on_play_card(card: Card, location: GridItem):
	print("Gameplay#on_play_card %s on %s" % [card, location])
	var new_card: Card = card.duplicate()
	new_card.size = location.size
	new_card.spawn_entity.connect(_on_spawn_entity)
	location.add_child(new_card)
	new_card.spawn()

func buy(inventoryItem):
	print("Buying ", inventoryItem)
	
	if(currentSols >= inventoryItem.cost):
		EventBus.sale.emit(inventoryItem, inventoryItem.cost)
		return true
	else:
		return false
		
func _on_sale(itemType, sols):
	print("Plant sold ", itemType, sols)
	updateCurrentSols(-1 * sols)
	
#func _on_plant(_gridItem, _currentInventoryItem: Card):
	#print("Planting ", _currentInventoryItem, " on ", _gridItem)
	#var card: Card = _currentInventoryItem.duplicate()
	#card.size = _gridItem.size
	#_gridItem.add_child(card)
	
func _on_plant(_gridItem, _currentInventoryItem):
	print("Planting ", _currentInventoryItem, " on ", _gridItem)
	var SceneToInstantiate = load(_currentInventoryItem.scene_file_path)
	var instance = SceneToInstantiate.instantiate()
	_gridItem.add_child(instance)

func updateCurrentSols(_sols):
	currentSols += _sols
	EventBus.sols_update.emit(currentSols)

func _on_gameover():
	print("Gameplay#GAME OVER")
	var next_level_resource = load("res://scenes/game_over_scene.tscn")
	load_scene(next_level_resource)
	
func _on_retry():
	print("Gameplay#retrying")
	load_scene(load("res://scenes/main.tscn"))
	
func load_scene(scene: Resource):
	print("Gameplay#load_scene %s" % scene)
	var instance = scene.instantiate()
	get_tree().root.add_child(instance)
	print("Scene %s loaded" % scene)
