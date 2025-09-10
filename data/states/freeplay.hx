static var freeplaySongIndex = 0;

static var freeplayDiffIndex = 1;

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
}

function handleInputs()
{
  if (controls.LEFT_P)
    {
        songStarted = false;
        {
            diff--;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
            diffChange("left");

            if (diff < 0)
            {
                diff = 2;
            }

            
            handleDiffs();
            trace("difficulty changed to:" + diffList[diff]);
        }
        
    }
}
