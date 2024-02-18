extends Node2D
@export var noteSpeed = 1
@export var userNoteSpeed = 1.8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	noteSpeed = noteSpeed + userNoteSpeed
	queue_redraw()
	

func _draw():
	#Note originating at center and moving outward to the hit registration area
	draw_arc(Vector2(960, 540), noteSpeed, (175*PI/180),(140*PI/180), 100, Color(0, 0, 1, 0.5), 20.0)
