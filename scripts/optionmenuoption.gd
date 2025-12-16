extends Control

@onready var cursedbutton = $CursedOption

# Called when the node enters the scene tree for the first time.
func _ready():
	MusicManager.set_muffled(true)

func _exit_tree():
	MusicManager.set_muffled(false)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_retour_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenumain.tscn")

func _on_cursed_option_pressed():
	$bruitchelou.play()
	var tween = create_tween()
	tween.tween_property(cursedbutton, "rotation_degrees", cursedbutton.rotation_degrees + 180, 0.8 ).set_trans(Tween.TRANS_BACK).set_ease(Tween.EASE_OUT)
