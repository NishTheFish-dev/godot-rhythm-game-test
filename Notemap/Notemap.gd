extends Node2D
class_name Note

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


#Main function to handle notes
func place_note(position, beat):
	#Step 1: create the note as a Node
	var note = Note.new()
	note.name = "CreatedNote"
	add_child(note)

	#Step 2: figure out what position the note will be in
	match position:
		"one":
			note.notePlaceAndColor = [(175*PI/180), (140*PI/180), Color(0, 0, 1, 0.5)]
		"two":
			note.notePlaceAndColor = [(130*PI/180),(95*PI/180), Color(0, 1, 0, 0.5)]
		"three":
			note.notePlaceAndColor = [(85*PI/180),(50*PI/180), Color(1, 1, 0, 0.5)]
		"four":
			note.notePlaceAndColor = [(40*PI/180),(5*PI/180), Color(1, 0, 0, 0.5)]

	#Step 3: Assign what beat the note will land on
	#beat = note.songPositionInBeats
