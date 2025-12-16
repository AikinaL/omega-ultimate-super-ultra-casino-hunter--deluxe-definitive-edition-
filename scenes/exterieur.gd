extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.stop_music()
	$Backrooms.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
