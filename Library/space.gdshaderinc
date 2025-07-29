// #include "res://_Library/space.gdshaderinc"

vec2 uv2plane(vec2 uv){
	return 2.0*vec2(uv.x,1.0-uv.y)-1.0;
}

vec2 plane2polar(vec2 plane){
	return vec2(atan(plane.x,plane.y)/TAU,length(plane));
}