var warning:FunkinSprite = new FunkinSprite(0,0);
warning.loadGraphic(Paths.image("menus/warning/warning_screen"));
add(warning);

var warningBen:FunkinSprite = new FunkinSprite(800, 300);
warningBen.frames = Paths.getSparrowAtlas("menus/warning/ben_warning_chibi");
warningBen.animation.addByPrefix("Wiggle", "ben wiggle", 24, true);
warningBen.animation.play("Wiggle");
warningBen.scale.set(0.5,0.5);
add(warningBen);

function update()
{
    if (controls.ACCEPT)
    {
        FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
        new FlxTimer().start(2.2 , function(tmr:FlxTimer)
            {
                FlxG.switchState(new TitleState());
            });
    }
}