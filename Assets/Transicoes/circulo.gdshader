shader_type canvas_item;
render_mode unshaded;

uniform float circle_size : hint_range(-1.5, 1.00);
uniform vec2 endPoint = vec2(0.5, 0.5);

void fragment() {
    float aspect_ratio = SCREEN_PIXEL_SIZE.x / SCREEN_PIXEL_SIZE.y;
    vec2 uv = UV - vec2(0.5);
    if (aspect_ratio > 1.0) {
        uv.x /= aspect_ratio;
    } else {
        uv.y *= aspect_ratio;
    }
    uv += vec2(0.5);
    float dist = distance(uv, endPoint);

    COLOR.a = step((1.0 - circle_size), dist);
}
