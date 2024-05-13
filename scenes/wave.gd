class_name Wave extends GridContainer

var step_index: int = 0
var steps: Array
var current_step

signal grid_item_action
signal wave_started(wave: Wave)
signal moved_to_step(column)

var cellType: Object

# Called when the node enters the scene tree for the first time.
func _ready():
	print("Wave#columns %s" % columns)
	steps = find_children("", "VBoxContainer")
	
func set_current_step(index: int):
	step_index = index
	current_step = steps[index]
	moved_to_step.emit(current_step)

func start():
	print("Wave %s starting" % self)
	wave_started.emit(self)

func _on_grid_item_selected(grid_item):
	print("GridMap item selected ", grid_item)
	grid_item_action.emit(grid_item)

func _on_inventory_item_select(type):
	cellType = type

func _on_wave_started(wave: Wave):
	print("Wave#Wave %s started" % wave)
	set_current_step(0)

func _on_moved_to_step(step):
	print("Wave#moved_to_step %s" % step)
	for item in step.find_children("", "GridItem"):
		if item.card:
			print("Wave#GridItem %s has Card %s" % [item, item.card])
			item.card.spawn_entity.connect(_on_spawn_entity)
			item.card.spawn()
		else:
			print("Wave#GridItem has no Card")
	# TODO	
	# Iterate over the GridItems
	# and Spawn entities

func _on_spawn_entity(card: Card):
	print("Wave#on_spawn_entity %s" % card.entity)
	EventBus.spawn_entity.emit(card)
