extends Area2D

@export var size : int = 50
@export var color : Color = Color.YELLOW
@export var sols : int = 25

signal sol_pickup

func _draw():
	var position : Vector2 = Vector2(0.00, 0.00)
	draw_circle(position, size, color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_mouse_entered():
	print("Sol pickup ", sols)
	sol_pickup.emit(self)
