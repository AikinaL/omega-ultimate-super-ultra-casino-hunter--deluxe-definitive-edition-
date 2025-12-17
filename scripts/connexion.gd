extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("enter"):
		$Informations.show()

func _on_retour_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenumain.tscn")
