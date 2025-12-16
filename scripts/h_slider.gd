extends HSlider

@onready var brightness_overlay := $"../ColorRect2"

func _ready():
# Set initial value
	_update_brightness(value)
	connect("value_changed", Callable(self, "_update_brightness"))

func _update_brightness(val):
	var mat = brightness_overlay.material as ShaderMaterial
	mat.set_shader_parameter("brightness", val)
