class_name Note extends Node2D

# Initial variables
var songBpm
var secPerBeat 
var songPosition
var songPositionInBeats = 1
var beatPosition

#Temporary variable to calculate metronome
var spTemp = 0

#Offset, in milliseconds
@export var offset = 0
#Control how fast notes slide down on the screen
@export var noteSpeed = 1
@export var userNoteSpeed = 1.8

#Metronome setter for updating
var blinkerRect : float:
	set(opacity):
		blinkerRect = opacity
		queue_redraw()

#Array variable holder for determining note placement & color
var notePlaceAndColor: Array:
	set(placement):
		notePlaceAndColor = placement
		queue_redraw()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup song BPM & audio track positioning
	songBpm = $Notemap/CreatedNote.stream.get_bpm() 
	secPerBeat = float(60 / $Notemap/CreatedNote.stream.get_bpm())
	songPosition = float($Notemap/CreatedNote.get_playback_position() - (offset / 1000))
	songPositionInBeats = int(songPosition / secPerBeat)
	spTemp = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	noteSpeed = noteSpeed + userNoteSpeed
	queue_redraw()
	
	songPosition = float($Notemap/CreatedNote.get_playback_position() - (offset / 1000))
	songPositionInBeats = int(songPosition / secPerBeat)
	if (songPositionInBeats > spTemp):
		blink()
		spTemp += secPerBeat

#Handles rendering of notes
func _draw():
	draw_arc(Vector2(960, 540), noteSpeed, notePlaceAndColor[0], notePlaceAndColor[1], 100, notePlaceAndColor[2], 20.0)

#Test function for metronome
func blink() -> void:
	blinkerRect = 1
	$Notemap/CreatedNote.play()
	await get_tree().create_timer(secPerBeat / 4).timeout
	blinkerRect = 0.1
