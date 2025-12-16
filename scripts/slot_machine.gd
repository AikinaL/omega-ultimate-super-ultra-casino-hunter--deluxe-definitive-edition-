extends Control

@onready var reel1: Label = $VBoxContainer/HBoxContainer/Reel1
@onready var reel2: Label = $VBoxContainer/HBoxContainer/Reel2
@onready var reel3: Label = $VBoxContainer/HBoxContainer/Reel3
@onready var result_label: Label = $VBoxContainer/ResultLabel
@onready var spin_button: Button = $VBoxContainer/SpinButton

@onready var sfx_roll: AudioStreamPlayer = $"../AudioRolling"
@onready var sfx_win: AudioStreamPlayer = $"../AudioWin"
@onready var sfx_lose: AudioStreamPlayer = $"../AudioLose"

# Win animation sprites
@onready var win_animation1: AnimatedSprite2D = $"../AnimatedSprite2D"
@onready var win_animation2: AnimatedSprite2D = $"../AnimatedSprite2D2"

var symbols = ["🍒", "🍋", "🔔", "⭐", "7"]
var spinning := false

func _ready():
	spin_button.pressed.connect(spin)

	# Hide and stop win animations at start
	win_animation1.visible = false
	win_animation2.visible = false
	win_animation1.stop()
	win_animation2.stop()


func play_win_animation():
	win_animation1.visible = true
	win_animation2.visible = true
	win_animation1.play()
	win_animation2.play()

	# Connect animation_finished signals to hide the sprites when done
	if not win_animation1.is_connected("animation_finished", Callable(self, "_on_win_animation_finished")):
		win_animation1.animation_finished.connect(Callable(self, "_on_win_animation_finished"))
	if not win_animation2.is_connected("animation_finished", Callable(self, "_on_win_animation_finished")):
		win_animation2.animation_finished.connect(Callable(self, "_on_win_animation_finished"))


func _on_win_animation_finished(anim_name: String):
	win_animation1.visible = false
	win_animation2.visible = false


func spin():
	if spinning:
		return

	spinning = true
	spin_button.disabled = true
	result_label.text = ""

	# Start rolling sound
	sfx_roll.play()

	await roll_reel(reel1, 1)
	await roll_reel(reel2, 1.2)
	await roll_reel(reel3, 1.4)

	# Stop rolling sound
	sfx_roll.stop()

	check_win()

	spin_button.disabled = false
	spinning = false


func roll_reel(reel: Label, duration: float) -> void:
	var elapsed := 0.0
	var interval := 0.05

	while elapsed < duration:
		reel.text = random_symbol()
		await get_tree().create_timer(interval).timeout
		elapsed += interval

	reel.text = random_symbol()


func random_symbol() -> String:
	return symbols.pick_random()


func check_win():
	if reel1.text == reel2.text and reel2.text == reel3.text:
		result_label.text = "🎉 JACKPOT!"
		sfx_win.play()
		play_win_animation()
	elif reel1.text == reel2.text or reel2.text == reel3.text or reel1.text == reel3.text:
		result_label.text = "😊 Epic win!"
		sfx_win.play()
		play_win_animation()
	else:
		result_label.text = "❌ Lost 1000 $"
		sfx_lose.play()
