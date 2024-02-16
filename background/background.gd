extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	draw_circle(Vector2(960, 540), 500, Color( 0.75, 0.75, 0.75, 1 ))
	draw_circle(Vector2(960, 540), 490, Color( 0.07, 0.07, 0.07, 1 ))
