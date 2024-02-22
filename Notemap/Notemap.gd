extends Node2D

signal notePlacement(position)
signal noteBeatmap(beatPos)
signal drawNote
signal createNote

var notePlaceAndColor: Array:
	set(placement):
		notePlaceAndColor = placement
		queue_redraw()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _draw():
	place_Note("one", 4)
	place_Note("three", 4)

func place_Note(position, beatPos):
	createNote.emit()
	notePlacement.emit(position)
	noteBeatmap.emit(beatPos)
	#drawNote.emit()
