extends Node2D

signal notePlacement(position)
signal noteBeatmap(beatPos)

# Called when the node enters the scene tree for the first time.
func _ready():
	place_Note("one", 4)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func place_Note(position, beatPos):
	notePlacement.emit(position)
	noteBeatmap.emit(beatPos)
	pass
