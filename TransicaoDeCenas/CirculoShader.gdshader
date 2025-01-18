shader_type canvas_item;
render_mode unshaded;

uniform float circle_size : hint_range(-1.5, 1.00);
uniform vec2 endPoint = vec2(0.5, 0.5);
uniform float screen_width;
uniform float screen_height;

void fragment() {
	float ratio = screen_width / screen_height;
	vec2 point = vec2(mix(0.5, endPoint.x, ratio), endPoint.y);
	float dist = distance(point, vec2(mix(0.5, UV.x, ratio), UV.y));
	COLOR.a = step((1.0 - circle_size), dist);
}