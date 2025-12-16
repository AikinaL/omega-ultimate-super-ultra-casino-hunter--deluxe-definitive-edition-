extends Node

var current_music: AudioStreamPlayer = null
var current_stream: AudioStream = null

func play_music(stream: AudioStream, _loop: bool=true):
	if current_music:
		current_music.stop()
		current_music.queue_free()
	current_music = AudioStreamPlayer.new()
	current_music.stream = stream
	current_music.bus = "Master"
	add_child(current_music)
	current_music.play()

func set_muffled(muffled: bool):
	if not current_music:
		return
	if muffled:
		current_music.bus = "Muffled"
	else:
		current_music.bus = "Master"
