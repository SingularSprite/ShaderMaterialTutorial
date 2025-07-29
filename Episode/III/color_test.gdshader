shader_type canvas_item;

uniform vec4 color_0 : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform vec4 color_1 : source_color = vec4(0.0, 0.0, 0.0, 1.0);
uniform sampler2D gradient_texture;

vec3 hsv2rgb(vec3 hsv) {
    float h = hsv.x;
    float s = hsv.y;
    float v = hsv.z;

    float c = v * s;
    float h_prime = mod(h * 6.0, 6.0);
    float x = c * (1.0 - abs(mod(h_prime, 2.0) - 1.0));

    vec3 rgb;

    if (0.0 <= h_prime && h_prime < 1.0) {
        rgb = vec3(c, x, 0.0);
    } else if (1.0 <= h_prime && h_prime < 2.0) {
        rgb = vec3(x, c, 0.0);
    } else if (2.0 <= h_prime && h_prime < 3.0) {
        rgb = vec3(0.0, c, x);
    } else if (3.0 <= h_prime && h_prime < 4.0) {
        rgb = vec3(0.0, x, c);
    } else if (4.0 <= h_prime && h_prime < 5.0) {
        rgb = vec3(x, 0.0, c);
    } else {
        rgb = vec3(c, 0.0, x);
    }

    float m = v - c;
    return rgb + vec3(m);
}

void fragment() {
	//vec4 color = (1.0-UV.x)*color_0+UV.x*color_1;
	vec4 color = texture(gradient_texture,vec2(UV.x,0.0));
	COLOR = color;
}
