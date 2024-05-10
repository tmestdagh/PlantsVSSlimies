extends GridContainer

signal grid_item_action

var cellType: Object

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_grid_item_selected(grid_item):
	print("GridMap item selected ", grid_item)
	grid_item_action.emit(grid_item)

func _on_inventory_item_select(type):
	cellType = type
