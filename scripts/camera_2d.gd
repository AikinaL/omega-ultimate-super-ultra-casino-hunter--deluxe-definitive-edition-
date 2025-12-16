extends Camera2D

var max_offset = Vector2(5, 5) # Maximum offset in pixels
var speed = 2.0 # How fast it moves

var time_passed = 0.0

func _process(delta):
	time_passed += delta
	# Smooth "floating" motion using sine waves
	var offset_x = sin(time_passed * speed) * max_offset.x
	var offset_y = cos(time_passed * speed * 0.7) * max_offset.y
	offset = Vector2(offset_x, offset_y)
