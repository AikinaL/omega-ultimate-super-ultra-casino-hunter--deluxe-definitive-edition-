extends Control
@onready var pauvre = $troppauvre
var screensize = DisplayServer.screen_get_size()
var random = RandomNumberGenerator.new()
var randomX = random.randi_range(175, screensize.x - 175)
var randomY = random.randi_range(45, screensize.y - 45)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_retour_pressed():
	get_tree().change_scene_to_file("res://scenes/mainmenumain.tscn")


func _on_pay_box_pressed():
	$booh.play()
	pauvre.show()
	randomX = random.randi_range(0, screensize.x - 750)
	randomY = random.randi_range(0, screensize.y - 750)
	pauvre.global_position = Vector2(randomX, randomY)
