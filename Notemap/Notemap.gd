extends Node2D

signal notePlacement(position)
signal noteBeatmap(beatPos)
signal drawNote

# Called when the node enters the scene tree for the first time.
func _ready():
	place_Note("three", 4)
	place_Note("one", 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func place_Note(position, beatPos):
	drawNote.emit()
	notePlacement.emit(position)
	noteBeatmap.emit(beatPos)
	pass
