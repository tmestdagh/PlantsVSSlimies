extends Node

var currentSols : int = 50
var currentInventoryItem : Object

const Sol : Resource = preload("res://scenes/sol.tscn")

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
	
func _on_plant(_gridItem: Control, _currentInventoryItem: Node):
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
