extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	print("main#_ready")
	#Utils.disable_and_hide_node($Levels)
	#Utils.disable_and_hide_node($Levels/Level)
	
	#load_level()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_level():
	Utils.disable_and_hide_node($LevelSelector)
	Utils.enable_and_show_node($Levels)
