extends Node2D

# Initial variables
var songBpm
var secPerBeat 
var songPosition
var songPositionInBeats = 1
# Called when the node enters the scene tree for the first time.

func _ready():
	# Setup song BPM & audio track positioning
	songBpm = $AudioStreamPlayer.stream.get_bpm()
	secPerBeat = float(60 / $AudioStreamPlayer.stream.get_bpm())
	songPosition = $AudioStreamPlayer.get_playback_position()
	songPositionInBeats = int(songPosition / secPerBeat)
	$AudioStreamPlayer.play()
	
	# Debug songPositionInBeats
	var timer = Timer.new()
	timer.autostart = true
	timer.wait_time = secPerBeat
	add_child(timer)
	timer.timeout.connect(func():
		print(songPositionInBeats)
	)



# Called every frame. 'delta' is the elapsed time since the previous frame.
# Updates songPosition and songPositionInBeats every frame
func _process(delta):
	songPosition = $AudioStreamPlayer.get_playback_position()
	songPositionInBeats = int(songPosition / secPerBeat)
	

