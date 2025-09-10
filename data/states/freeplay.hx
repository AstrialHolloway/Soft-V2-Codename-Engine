static var freeplaySongIndex = 0;

static var freeplayDiffIndex = 1;

var songStarted = false;

var songList:Array<String> =
[
    //Prelude
    "starcrossed", 
    //week 1
    "maturity", 
    "all is fair", 
    "no cigar", 
    //week 2
    "thriller", 
    "high spirits", 
    "repressed", 
    //week 3
    "playdate",
    "stay",
    "its complicated",
    //week 4
    "intuition",
    "catwalk",
    "spotlight",
    //week 5
    "faithful",
    "hope",
    "genesis",
    //week 6
    "begrudge",
    "every rose",
    "spikes",
    //epilogue
    "stars aligned",
    //extra
    "promise",
    "rolling girl",
    "lagtrain"
];

var diffList:Array<String> = 
[
    "easy",
    "normal", 
    "hard"
];

function update()
{
    handleInputs();
    handleDiffs();
}

function handleInputs()
{
  if (controls.LEFT_P)
    {
        if (songStarted == false)
        {
            freeplayDiffIndex--;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);

            if (freeplayDiffIndex < 0)
            {
                freeplayDiffIndex = 2;
            }
            
            trace("difficulty changed to:" + diffList[freeplayDiffIndex]);
        }
        
    }
    if (controls.RIGHT_P)
    {
        if (songStarted == false)
        {
            freeplayDiffIndex++;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);

            if (freeplayDiffIndex > 2)
            {
                freeplayDiffIndex = 0;
            }
            
            trace("difficulty changed to:" + diffList[freeplayDiffIndex]);
        }
        
    }
}

function handleDiffs();
{
    if (freeplayDiffIndex == 0)
    {
        //diffSprite.loadGraphic(Paths.image("menus/freeplay/easy"));
    }
    if (freeplayDiffIndex == 1)
    {
        //diffSprite.loadGraphic(Paths.image("menus/freeplay/normal"));
    }
    if (freeplayDiffIndex == 2)
    {
        //diffSprite.loadGraphic(Paths.image("menus/freeplay/hard"));
    }
}
