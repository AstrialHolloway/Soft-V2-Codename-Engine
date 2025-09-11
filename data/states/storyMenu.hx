import funkin.savedata.FunkinSave;

static var storyMenuWeekIndex = 0;

static var storyMenuDiffIndex = 1;

FunkinSave.load();

var weekList:Array<String> =
[
    "prelude",
    "week1",
    "week2",
    "week3",
    "week4",
    "week5",
    "week6",
    "epilogue"
];

var diffList:Array<String> = 
[
    "easy",
    "normal", 
    "hard"
];

function handleInputs()
{
    if (controls.LEFT_P)
    {
        storyMenuIndex--;
        
    }
    if (controls.RIGHT_P)
    {
         storyMenuIndex++;   
    }
    if (controls.ACCEPT)
    {
        FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
        new FlxTimer().start(2.2, function(tmr:FlxTimer)
        {
            PlayState.loadSong(songList[freeplaySongIndex], diffList[freeplayDiffIndex]);
            FlxG.switchState(new PlayState());
        });
    }
    if (controls.BACK)
    {
        FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
        new FlxTimer().start(2.2, function(tmr:FlxTimer)
        {
            FlxG.switchState(new MainMenuState());
        });
    }
}

