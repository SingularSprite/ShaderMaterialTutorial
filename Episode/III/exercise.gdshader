shader_type canvas_item;

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

vec4 rainbow_ring(vec2 uv){
	vec2 plane = (uv-0.5)*2.0;
	vec2 polar = vec2(atan(plane.y,plane.x),length(plane));
	float alpha = 0.0;
	if (polar.y>0.3 && polar.y<1.0){
		alpha = 1.0;
	}
	vec3 rgb = hsv2rgb(vec3(exp((polar.y-0.3)/0.7),1.0,1.0));
	return vec4(rgb,alpha);
}

vec4 triangle(vec2 uv, sampler2D triangle_gradient_texture){
	vec2 plane = vec2(uv.x,1.0-uv.y);
	float alpha = 0.0;
	if (plane.y<plane.x*2.0 && plane.y<-2.0*plane.x+2.0){
		alpha = 1.0;
	}
	vec3 rgb = texture(triangle_gradient_texture,vec2(uv.y,1.0)).xyz;
	return vec4(rgb,alpha);
}

void fragment() {
	COLOR = rainbow_ring(UV);
	//COLOR = triangle(UV,gradient_texture);
}