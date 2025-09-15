#pragma header

void main() {
    vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);

    if (color.a <= 0.0) {
        gl_FragColor = vec4(0.0);
        return;
    }

    // Check if the color is white (all channels near 1.0)
    if (color.r > 0.95 && color.g > 0.95 && color.b > 0.95) {
        color = vec4(0.0, 0.0, 0.0, color.a); // change to black
    }

    gl_FragColor = color;
}