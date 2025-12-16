shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float brightness : hint_range(0.0, 2.0) = 1.0;

void fragment() {
    vec4 bg = texture(SCREEN_TEXTURE, SCREEN_UV);
    COLOR = vec4(bg.rgb * brightness, bg.a);
}
