extends Node

@export var min_delay := 3.0
@export var max_delay := 8.0

var popup_scene: PackedScene = preload("res://scenes/pop-up.tscn")
var texts := [
	"You are being watched.",
	"Something feels off...",
	"Why are you here?",
    "Close me."
]

var active_popup: Control = null

func _ready() -> void:
	var parent = get_tree().current_scene
	if parent is Control:
		spawn_popups_loop()  # only start loop in 2D scene
	else:
		push_warning("Popup system disabled: current scene is not 2D.")


func spawn_popups_loop() -> void:
	while true:
		var delay = randf_range(min_delay, max_delay)
		await get_tree().create_timer(delay).timeout

		if active_popup != null:
			await active_popup.wait_to_close()

		# Spawn popup
		active_popup = popup_scene.instantiate() as Control

		var parent = get_tree().current_scene as Control
		if not parent or not active_popup:
			continue  # safety check

		# Add to tree first, so size is valid
		parent.add_child(active_popup)

		# Wait one frame for layout to update
		await get_tree().process_frame

		# Now we can safely get popup size
		#var popup_size = active_popup.get_size()
		var parent_size = parent.get_size()

		 #Randomize position fully on screen
		var random_pos = Vector2(
			randf_range(200, parent_size.x -200),
			randf_range(200, parent_size.y - 200))
		
		active_popup.position = random_pos

		active_popup.set_text(texts.pick_random())
		await active_popup.wait_to_close()
		active_popup = null
