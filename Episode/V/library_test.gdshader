shader_type canvas_item;

#include "res://_Library/color.gdshaderinc"
#include "res://_Library/space.gdshaderinc"

void fragment() {
	vec2 plane = uv2plane(UV);
	vec2 polar = plane2polar(plane);
	COLOR = vec4(hsv2rgb(vec3(polar.x,polar.y,1.0)),1.0);
}
