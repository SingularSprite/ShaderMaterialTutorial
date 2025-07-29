shader_type canvas_item;

vec2 polar(vec2 uv){
	vec2 plane = (uv-0.5)*2.0;
	vec2 polar = vec2(atan(plane.y,plane.x),length(plane));
	return polar;
}

float binary(vec2 polar_coord){
	float alpha = 0.0;
	if (polar_coord.y<=1.0){
		alpha = 1.0;
	}
	return alpha;
}

float linear(vec2 polar_coord){
	float alpha = 0.0;
	if (polar_coord.y<=0.5){
		alpha = 1.0;
	}else if(polar_coord.y<=1.0){
		alpha = 2.0-2.0*polar_coord.y;
	}
	return alpha;
}

float triangle (vec2 polar_coord){
	float alpha = 0.0;
	if (polar_coord.y<=0.5){
		alpha = 1.0;
	}else if(polar_coord.y<=1.0){
		alpha = sin((polar_coord.y-0.25)*TAU)/2.0+0.5;
	}
	return alpha;
}

void fragment() {
	vec2 polar_coord = polar(UV);
	//float alpha = binary(polar_coord);
	//float alpha = linear(polar_coord);
	float alpha = triangle(polar_coord);
	COLOR = vec4(1.0, 1.0, 1.0, alpha);
}
