extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	print("main#_ready")
	Utils.disable_and_hide_node($Levels)
	# Disable all levels
	for level in find_children("", ""):
		Utils.disable_and_hide_node(level)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_level(level: Level):
	print("Main#load_level %s" % level)
	Utils.enable_and_show_node($Levels)
	Gameplay.current_level = level
	level.load()
	Utils.enable_and_show_node(level)


func _on_level_select(level: Level):
	print("Selecting LEVEL")
	load_level(level)
