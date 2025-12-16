extends Control

signal popup_closed

@onready var label: Label = $Panel/Label
@onready var close_button: Button = $Panel/Button

func _ready() -> void:
	close_button.pressed.connect(_on_close_pressed)

func set_text(text: String) -> void:
	label.text = text

func _on_close_pressed() -> void:
	emit_signal("popup_closed")
	queue_free()

# Helper to await popup closing
func wait_to_close():
	if is_inside_tree():
		await self.popup_closed
