#pragma header

uniform vec3 uRedColor;   // Custom red replacement
uniform vec3 uGreenColor; // Custom green replacement

void main()
{
    vec4 pixel = flixel_texture2D(bitmap, openfl_TextureCoordv);

    // Convert pixel RGB
    vec3 col = pixel.rgb;

    // Replace blue → white
    if (col.b > 0.5 && col.r < 0.3 && col.g < 0.3) {
        col = vec3(1.0, 1.0, 1.0);
    }

    // Replace green
    if (col.g > 0.5 && col.r < 0.3 && col.b < 0.3) {
        col = uGreenColor;
    }

    // Replace red
    if (col.r > 0.5 && col.g < 0.3 && col.b < 0.3) {
        col = uRedColor;
    }

    gl_FragColor = vec4(col, pixel.a);
}