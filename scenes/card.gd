class_name Card
extends TextureButton

@export var plant: Cell
@export var entity: PackedScene
@export var cost: int = 0

signal card_pressed(card: Card)
signal spawn_entity(card: Card)

func _ready():
	print("Card#ready cell=%s" % plant)
	print(get_children(false))
	
	#var host = get_node("../")
	#if host.playable:
		#host.card
	
	if !plant:
		plant = get_plant()
	
	#TODO Auto resize the cell
	if plant:
		# Do not show the Plant Cell
		plant.hide()
		# Use the plant cells texture as texture for the button
		
		print("Plant %s size=%s" % [plant, plant.size])
		plant.size = Vector2(50, 50)
		print("Plant %s resized to %s" % [plant, plant.size])

func get_plant():
	var _children = find_children("","Cell")
	if !_children.is_empty():
		return _children[0]


func _on_pressed():
	card_pressed.emit(self)
	
func spawn():
	print("Card#spawn wait_time=%d" % $EntitySpawnTimer.wait_time)
	$EntitySpawnTimer.start()

#func spawn():
	#print("Card#spawn_entity %s" % plant)
	#spawn_entity.emit(self)

func _on_spawn_entity(card: Card):
	print("Card#on_spawn_entity %s" % card)
	queue_free()


func _on_entity_spawn_timer_timeout():
	print("Card#spawn_entity %s" % entity)
	spawn_entity.emit(self)
