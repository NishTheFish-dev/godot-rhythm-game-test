extends Node2D

# Initial variables
var songBpm
var secPerBeat 
var songPosition
var songPositionInBeats = 1

#Temporary variable to calculate metronome
var spTemp = 0

#Offset, in milliseconds
@export var offset = 0

#Metronome setter for updating
var blinkerRect : float:
	set(opacity):
		blinkerRect = opacity
		queue_redraw()

@export var noteSpeed = 1
@export var userNoteSpeed = 1.8

enum {NOTESPEED = 1}

#Variable arrays for drawing
var one = [(175*PI/180), (140*PI/180), Color(0, 0, 1, 0.5)]
var two = [(130*PI/180),(95*PI/180), Color(0, 1, 0, 0.5)]
var three = [(85*PI/180),(50*PI/180), Color(1, 1, 0, 0.5)]
var four = [(40*PI/180),(5*PI/180), Color(1, 0, 0, 0.5)]

var notePlaceAndColor: Array:
	set(placement):
		notePlaceAndColor = placement
		queue_redraw()

var beatPosition


# Called when the node enters the scene tree for the first time.
func _ready():
	# Setup song BPM & audio track positioning
	songBpm = $Music.stream.get_bpm()
	secPerBeat = float(60 / $Music.stream.get_bpm())
	songPosition = float($Music.get_playback_position() - (offset / 1000))
	songPositionInBeats = int(songPosition / secPerBeat)
	spTemp = 0
	$Music.play()
	
	#Debug songPositionInBeats
	#var timer = Timer.new()
	#var delay = Timer.new()
	#timer.autostart = true
	#timer.wait_time = secPerBeat
	#delay.autostart = true
	#delay.wait_time = secPerBeat / 4
	#delay.one_shot = true
	#add_child(timer)
	#add_child(delay)
	#
	#timer.timeout.connect(func():
		#print(songPositionInBeats)
		#blinkerRect = 1
		#$Metronome.play()
		#delay.start(secPerBeat / 16)
		#delay.timeout.connect(func():
			#blinkerRect = 0.1
		#)
	#)
	

#Makes the rectangle blink and plays a metronome noise
func blink() -> void:
	blinkerRect = 1
	$Metronome.play()
	await get_tree().create_timer(secPerBeat / 4).timeout
	blinkerRect = 0.1
	
#Draw function for the rectangle
func _draw():
	#draw_rect(Rect2(960, 540, 200, 100), Color( 0.75, 0.75, 0.75, blinkerRect))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
# Updates songPosition and songPositionInBeats every frame, as well as syncing the metronome to the beat (no lag issues!)
func _process(_delta):
	songPosition = float($Music.get_playback_position() - (offset / 1000))
	songPositionInBeats = int(songPosition / secPerBeat)
	if (songPositionInBeats > spTemp):
		blink()
		spTemp += secPerBeat
		
	#Debug time delay
	#print(songPositionInBeats)
	#print(spTemp)

#Get beat position for notemap
func _on_notemap_note_beatmap(beatPos):
	#Get beat position from conductor class
	beatPos = songPositionInBeats
	pass

#Get note placement for notemap
func _on_notemap_note_placement(position):
	match position:
		"one":
			notePlaceAndColor = one
		"two":
			notePlaceAndColor = two
		"three":
			notePlaceAndColor = three
		"four":
			notePlaceAndColor = four

func _on_notemap_create_note():
	var note = Node2D.new()
	note.name = "CreatedNote"
	add_child(note)
	pass

func _on_notemap_draw_note():
	$CreatedNote.draw_arc(Vector2(960, 540), noteSpeed, notePlaceAndColor[0], notePlaceAndColor[1], 100, notePlaceAndColor[2], 20.0)
	pass
