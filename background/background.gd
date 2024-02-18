extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _draw():
	
	#Draw circles for game area
	draw_circle(Vector2(960, 540), 500, Color( 0.75, 0.75, 0.75, 1 ))
	draw_circle(Vector2(960, 540), 490, Color( 0.07, 0.07, 0.07, 1 ))
	
	#Draw arcs for note registration areas
	draw_arc(Vector2(960, 540), 450, (175*PI/180),(140*PI/180), 100, Color(0, 0, 1, 0.5), 20.0)
	draw_arc(Vector2(960, 540), 450, (130*PI/180),(95*PI/180), 100, Color(0, 1, 0, 0.5), 20.0)
	draw_arc(Vector2(960, 540), 450, (85*PI/180),(50*PI/180), 100, Color(1, 1, 0, 0.5), 20.0)
	draw_arc(Vector2(960, 540), 450, (40*PI/180),(5*PI/180), 100, Color(1, 0, 0, 0.5), 20.0)
	
	#Draw lines to separate the note registration areas
	draw_line(Vector2(960, 540), Vector2(470, 540), Color(0.75, 0.75, 0.75, 0.1), 2.0, true)
	draw_line(Vector2(960, 540), Vector2(1450, 540), Color(0.75, 0.75, 0.75, 0.1), 2.0, true)
	draw_line(Vector2(960, 540), Vector2(960, 1030), Color(0.75, 0.75, 0.75, 0.1), 2.0, true)
	draw_line(Vector2(960, 540), Vector2(960 - 250*sqrt(2), 530 + 250*sqrt(2)), Color(0.75, 0.75, 0.75, 0.1), 2.0, true)
	draw_line(Vector2(960, 540), Vector2(960 + 250*sqrt(2), 530 + 250*sqrt(2)), Color(0.75, 0.75, 0.75, 0.1), 2.0, true)
