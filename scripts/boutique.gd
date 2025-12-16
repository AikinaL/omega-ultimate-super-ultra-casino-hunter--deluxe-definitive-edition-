extends Control

func _ready():
	MusicManager.set_muffled(true)

func _exit_tree():
	MusicManager.set_muffled(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_retour_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenumain.tscn")
