extends Node2D
#@export var noteSpeed = 1
#@export var userNoteSpeed = 1.8
#
#enum {NOTESPEED = 1}
#
##Variable arrays for drawing
#var one = [(175*PI/180), (140*PI/180), Color(0, 0, 1, 0.5)]
#var two = [(130*PI/180),(95*PI/180), Color(0, 1, 0, 0.5)]
#var three = [(85*PI/180),(50*PI/180), Color(1, 1, 0, 0.5)]
#var four = [(40*PI/180),(5*PI/180), Color(1, 0, 0, 0.5)]
#
#var notePlaceAndColor: Array:
	#set(placement):
		#notePlaceAndColor = placement
		#queue_redraw()
#
#var beatPosition
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
##Debug
##func noteBeatmap(position, beatPos):
	##notePlacement(position)
	##beatPosition = beatPos
	##pass
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#noteSpeed = noteSpeed + userNoteSpeed
	#queue_redraw()
#
#func _draw():
	##Note originating at center and moving outward to the hit registration area
	##draw_arc(Vector2(960, 540), noteSpeed, notePlaceAndColor[0], notePlaceAndColor[1], 100, notePlaceAndColor[2], 20.0)
	#pass
#
##Get note placement for notemap
#func _on_notemap_note_placement(position):
	#match position:
		#"one":
			#notePlaceAndColor = one
		#"two":
			#notePlaceAndColor = two
		#"three":
			#notePlaceAndColor = three
		#"four":
			#notePlaceAndColor = four
	#$Notemap.draw_arc(Vector2(960, 540), noteSpeed, notePlaceAndColor[0], notePlaceAndColor[1], 100, notePlaceAndColor[2], 20.0)
#
#
