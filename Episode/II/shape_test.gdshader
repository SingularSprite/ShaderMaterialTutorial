shader_type canvas_item;

bool display_rec (vec2 length_width, vec2 uv){
	if (uv.x>0.5-length_width.x/2.0 && uv.x<0.5+length_width.x/2.0 &&
		uv.y>0.5-length_width.y/2.0 && uv.y<0.5+length_width.y/2.0){
		return true;
	}else{
		return false;
	}
}

bool display_disk(float radius, vec2 uv){
	uv = (uv-0.5)*2.0;
	vec2 polar = vec2(atan(uv.y/uv.x),length(uv));
	if (polar.y<radius){
		return true;
	}else{
		return false;
	}
}

bool display_ring(float inner_radius, float outter_radius, vec2 uv){
	uv = (uv-0.5)*2.0;
	vec2 polar = vec2(atan(uv.y/uv.x),length(uv));
	if (polar.y<outter_radius && polar.y>inner_radius){
		return true;
	}else{
		return false;
	}
}

bool display_warning_shape(vec2 uv){
	uv = (uv-0.5)*2.0;
	vec2 polar = vec2(atan(uv.y,uv.x),length(uv));
	if (polar.y<0.6 && polar.y>0.2){
		//if ((polar.x>-PI && polar.x<-PI*2.0/3.0)||
			//(polar.x>-PI/3.0 && polar.x<0.0)||
			//(polar.x>PI/3.0 && polar.x<PI*2.0/3.0)){
			//return true;
		//}else{
			//return false;
		//}
		bool flag = false;
		for (int i=0; i<3; i++){
			if (polar.x>-PI+float(i)*PI*2.0/3.0 &&
				polar.x<-PI*2.0/3.0+float(i)*PI*2.0/3.0){
					flag = true;
				}
		}
		return flag;
		
	}else if(polar.y<0.1){
		return true;
	}else{
		return false;
	}
}


void fragment() {
	bool display = false;
	//if(UV.x>0.3 && UV.x<0.7 && UV.y>0.3 && UV.y<0.7){
		//display = true;
	//}
	
	//display = display_rec(vec2(0.3,0.8),UV);
	//display = display_disk(1.0,UV);
	//display = display_ring(0.2,0.6,UV);
	display = display_warning_shape(UV);
	if (display){
		COLOR = vec4(0.0,0.0,0.0,1.0);
	}else{
		COLOR = vec4(1.0,1.0,0.0,1.0);
	}
}
