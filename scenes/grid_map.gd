extends GridContainer

signal grid_item_action

var cellType: Object

func _on_grid_item_selected(grid_item):
	print("GridMap item selected ", grid_item)
	grid_item_action.emit(grid_item)

func _on_inventory_item_select(type):
	cellType = type
