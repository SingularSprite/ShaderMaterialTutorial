// #include "res://_Library/color.gdshaderinc"

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

vec3 rgb2hsv(vec3 rgb) {
    float r = rgb.r;
    float g = rgb.g;
    float b = rgb.b;

    float maxc = max(max(r, g), b);
    float minc = min(min(r, g), b);
    float delta = maxc - minc;

    float h = 0.0;
    if (delta > 0.00001) {
        if (maxc == r) {
            h = mod((g - b) / delta, 6.0);
        } else if (maxc == g) {
            h = ((b - r) / delta) + 2.0;
        } else {
            h = ((r - g) / delta) + 4.0;
        }
        h /= 6.0;
        if (h < 0.0) h += 1.0;
    }

    float s = (maxc == 0.0) ? 0.0 : delta / maxc;
    float v = maxc;

    return vec3(h, s, v);
}