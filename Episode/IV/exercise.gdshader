shader_type canvas_item;

uniform sampler2D curve;

vec2 polar(vec2 uv){
	vec2 plane = (uv-0.5)*2.0;
	vec2 polar = vec2(atan(plane.y,plane.x),length(plane));
	return polar;
}

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

float input_curve (vec2 polar_coord, sampler2D curve_texture){
	return texture (curve_texture,vec2(polar_coord.y,0.0)).x;
}

void fragment() {
	vec2 polar_coord = polar(UV);
	float alpha = input_curve(polar_coord, curve);
	
	vec3 rgb = hsv2rgb(vec3 (polar_coord.x/TAU,1.0,1.0));
	
	COLOR = vec4(rgb,alpha);
	
}
