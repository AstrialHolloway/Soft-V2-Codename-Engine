import funkin.savedata.FunkinSave;

static var freeplaySongIndex = 0;

static var freeplayDiffIndex = 1;

var score;

var saveData;

FunkinSave.load();

var bgSprite:FunkinSprite = new FunkinSprite(-86,-180);
bgSprite.loadGraphic(Paths.image("menus/freeplay/bg"));
bgSprite.scale.set(0.67, 0.67);
add(bgSprite);

var diffSprite:FunkinSprite = new FunkinSprite(605,525);
diffSprite.loadGraphic(Paths.image("menus/freeplay/diff/normal"));
diffSprite.scale.set(0.67, 0.67);
add(diffSprite);


var sidebarSprite:FunkinSprite = new FunkinSprite(-235, -180);
sidebarSprite.loadGraphic(Paths.image("menus/freeplay/sidebar"));
sidebarSprite.scale.set(0.67, 0.67);
add(sidebarSprite);

var statsSprite:FunkinSprite = new FunkinSprite(810,490);
statsSprite.loadGraphic(Paths.image("menus/freeplay/score"));
statsSprite.scale.set(0.67, 0.67);
add(statsSprite);

var arrowLeftSprite:FunkinSprite = new FunkinSprite(623,610);
arrowLeftSprite.loadGraphic(Paths.image("menus/freeplay/arrow"));
arrowLeftSprite.scale.set(0.67, 0.67);
add(arrowLeftSprite);

var arrowRightSprite:FunkinSprite = new FunkinSprite(885,595);
arrowRightSprite.loadGraphic(Paths.image("menus/freeplay/arrow"));
arrowRightSprite.scale.set(0.67, 0.67);
arrowRightSprite.angle = 178;
add(arrowRightSprite);

var scoreLabel = new FlxText(1010, 638, 1000, "0", 10);
scoreLabel.setFormat(Paths.font("Jack Armstrong BB.ttf"), 74, FlxColor.BLACK, "left");
add(scoreLabel);

var songStarted = false;

// -------------------------
// Scrollable Song Cards
// -------------------------


var cardList:Array<String> = [
    "starcrossed", "maturity", "all-is-fair", "no-cigar",
    "thriller", "high-spirits", "repressed",
    "playdate", "stay", "it's-complicated",
    "intuition", "catwalk", "spotlight",
    "faithful", "hope", "genesis",
    "begrudge", "every-rose", "spikes",
    "stars-aligned",
    "promise", "rolling-girl", "lagtrain"
];

var songTags:Array<FunkinSprite> = [];

var startX:Float = -100; // where the column starts
var startY:Float = 150;  // where the center (selected) card should be
var spacing:Float = 250; // vertical spacing between each
var scrollSpeed:Float = 6; // how fast it eases

for (i in 0...cardList.length) {
    var tag:FunkinSprite = new FunkinSprite(startX, startY + (i * spacing));
    tag.loadGraphic(Paths.image("menus/freeplay/cards/" + cardList[i]));
    tag.antialiasing = true;
    tag.scale.set(0.67, 0.67);
    add(tag);

    songTags.push(tag);
}

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

function create()
{

    trace("Freeplay Opened");
}

var timethingidfk:Float = 0;

function update(elapsed:Float)
{
    
    saveData = FunkinSave.getSongHighscore(songList[freeplaySongIndex], diffList[freeplayDiffIndex]);
    score = saveData.score;
    handleInputs();
    handleDiffs();
    timethingidfk = elapsed;
    CoolUtil.playMenuSong();
    scoreLabel.text = score;
}

function handleInputs()
{
    // --- Handle controls
    if (controls.UP_P) {
        freeplaySongIndex--;
        if (freeplaySongIndex < 0)
        {
            freeplaySongIndex = cardList.length-1;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
    }
    if (controls.DOWN_P) {
        freeplaySongIndex++;
        if (freeplaySongIndex > cardList.length-1)
        {
            freeplaySongIndex = 0;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
    }

    // --- Smooth scroll positions
    for (i in 0...songTags.length) {
        var targetY:Float = startY + ((i - freeplaySongIndex) * spacing);
        songTags[i].y = FlxMath.lerp(songTags[i].y, targetY, scrollSpeed * timethingidfk);

        // Fade non-selected cards
        if (i == freeplaySongIndex) {
            songTags[i].alpha = FlxMath.lerp(songTags[i].alpha, 1.0, 10 * timethingidfk);
        } else {
            songTags[i].alpha = FlxMath.lerp(songTags[i].alpha, 0.4, 10 * timethingidfk);
        }
    }   
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

function handleDiffs()
{
    if (freeplayDiffIndex == 0)
    {
        diffSprite.loadGraphic(Paths.image("menus/freeplay/diff/easy"));
    }
    if (freeplayDiffIndex == 1)
    {
        diffSprite.loadGraphic(Paths.image("menus/freeplay/diff/normal"));
    }
    if (freeplayDiffIndex == 2)
    {
        diffSprite.loadGraphic(Paths.image("menus/freeplay/diff/hard"));
    }
}
