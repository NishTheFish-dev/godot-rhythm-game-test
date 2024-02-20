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
	draw_rect(Rect2(960, 540, 200, 100), Color( 0.75, 0.75, 0.75, blinkerRect))

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
