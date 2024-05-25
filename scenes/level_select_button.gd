extends Button

@export var level: int = 0
@export var scene: Level

signal select_level(level: Level)

func _ready():
	print("LevelSelectButton#ready")
	self.text = "LEVEL %d" % level

func _on_pressed():
	print("LevelSelectButton Level %d pressed" % level)
	select_level.emit(scene)


func _on_select_level(level):
	queue_free()
