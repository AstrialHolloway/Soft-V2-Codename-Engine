#pragma header

uniform vec3 redTarget;    // replacement color for red
uniform vec3 greenTarget;  // replacement color for green

void main()
{
    vec4 color = flixel_texture2D(bitmap, openfl_TextureCoordv);

    // detect "red" pixels
    if (color.r > 0.8 && color.g < 0.2 && color.b < 0.2) {
        color.rgb = redTarget;
    }
    // detect "green" pixels
    else if (color.g > 0.8 && color.r < 0.2 && color.b < 0.2) {
        color.rgb = greenTarget;
    }

    gl_FragColor = color;
}