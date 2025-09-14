import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.ui.FlxBarFillDirection;
import flixel.util.FlxStringUtil;
import funkin.savedata.FunkinSave;


static var freeplaySongIndex = 0;

static var freeplayDiffIndex = 1;

var score;

var saveData;

var devmode = true;

// Load shader
var colorShader:CustomShader = new CustomShader("rgbPalette");






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
sidebarSprite.shader = colorShader;
add(sidebarSprite);

var statsSprite:FunkinSprite = new FunkinSprite(810,490);
statsSprite.loadGraphic(Paths.image("menus/freeplay/score"));
statsSprite.scale.set(0.67, 0.67);
statsSprite.shader = colorShader;
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

var startX:Float = 30; // where the column starts
var startY:Float = 0;  // where the center (selected) card should be
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
    "it's complicated",
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



var songData:Array<SongColorData> = [

    // Prelude
    { r: [0.259,0.537,0.278], g: [0.533,0.718,1.0] },

    // Week 1
    { r: [0.251,0.353,0.522], g: [0.518,0.459,0.247] },
    { r: [0.251,0.353,0.522], g: [0.518,0.459,0.247] },
    { r: [0.251,0.353,0.522], g: [0.518,0.459,0.247] },

    // Week 2
    { r: [0.965,0.835,0.937], g: [0.835,0.608,0.502] },
    { r: [0.965,0.835,0.937], g: [0.835,0.608,0.502] },
    { r: [0.082,0.141,0.188], g: [0.561,0.518,0.455] },

    // Week 3
    { r: [0.800,0.439,0.612], g: [0.094,0.451,0.333] },
    { r: [0.800,0.439,0.612], g: [0.094,0.451,0.333] },
    { r: [0.800,0.439,0.612], g: [0.094,0.451,0.333] },

    // Week 4
    { r: [0.702,0.686,1.0], g: [0.941,0.600,0.667] },
    { r: [0.702,0.686,1.0], g: [0.941,0.600,0.667] },
    { r: [0.702,0.686,1.0], g: [0.941,0.600,0.667] },

    // Week 5
    { r: [1.0,0.757,0.651], g: [0.412,0.541,0.737] },
    { r: [1.0,0.757,0.651], g: [0.412,0.541,0.737] },
    { r: [0.082,0.141,0.188], g: [0.561,0.518,0.455] },

    // Week 6
    { r: [0.467,0.682,0.851], g: [0.451,0.286,0.067] },
    { r: [0.467,0.682,0.851], g: [0.451,0.286,0.067] },
    { r: [0.467,0.682,0.851], g: [0.451,0.286,0.067] },

    // Epilogue
    { r: [0.259,0.537,0.278], g: [0.533,0.718,1.0] },

    // Extra
    { r: [0.573,0.443,0.992], g: [0.353,0.553,0.004] },
    { r: [0.275,0.275,0.275], g: [0.706,0.706,0.706] },
    { r: [0.698,0.698,0.698], g: [0.941, 0.941, 0.941] }
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

var yOffsetDebugThing = -150;

var debugDataDebLabel = new FlxText(260, 145+yOffsetDebugThing, 1000, "Debug Data:", 10);
debugDataDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 40, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
debugDataDebLabel.borderSize = 1.25;
add(debugDataDebLabel);

var curNumDebLabel = new FlxText(260, 180+yOffsetDebugThing, 1000, "Song Index: " + freeplaySongIndex, 10);
curNumDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curNumDebLabel.borderSize = 1.25;
add(curNumDebLabel);

var curSongDebLabel = new FlxText(260, 205+yOffsetDebugThing, 1000, "Song: " + songList[freeplaySongIndex], 10);
curSongDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curSongDebLabel.borderSize = 1.25;
add(curSongDebLabel);

var curDiffDebLabel = new FlxText(260, 230+yOffsetDebugThing, 1000, "Difficulty: " + diffList[freeplayDiffIndex], 10);
curDiffDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curDiffDebLabel.borderSize = 1.25;
add(curDiffDebLabel);

var curScoreDebLabel = new FlxText(260, 255+yOffsetDebugThing, 1000, "Score: ", 10);
curScoreDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curScoreDebLabel.borderSize = 1.25;
add(curScoreDebLabel);

var curAccuracyDebLabel = new FlxText(260, 280+yOffsetDebugThing, 1000, "Accuracy: ", 10);
curAccuracyDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curAccuracyDebLabel.borderSize = 1.25;
add(curAccuracyDebLabel);

var curMissesDebLabel = new FlxText(260, 305+yOffsetDebugThing, 1000, "Misses: ", 10);
curMissesDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curMissesDebLabel.borderSize = 1.25;
add(curMissesDebLabel);

var curDateDebLabel = new FlxText(260, 330+yOffsetDebugThing, 1000, "Date Achieved: ", 10);
curDateDebLabel.setFormat("fonts/Jack Armstrong BB.ttf", 25, FlxColor.WHITE, "right", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
curDateDebLabel.borderSize = 1.25;
add(curDateDebLabel);

var timethingidfk:Float = 0;

var colorShit = songData[freeplaySongIndex];

colorShader.b = [1,1,1]; // blue channel influence
colorShader.mult = 1; // strength (0 = off, 1 = full)

function create()
{
    CoolUtil.playMusic("music/softFreeplay.ogg");
}

function update(elapsed:Float)
{
    saveData = FunkinSave.getSongHighscore(songList[freeplaySongIndex], diffList[freeplayDiffIndex]);
    score = saveData.score;
    handleInputs();
    handleDiffs();
    debugStatsHandler();
    timethingidfk = elapsed;
    
    scoreLabel.text = score;
    
    colorShit = songData[freeplaySongIndex];

    colorShader.r = colorShit.r; // red channel influence
    colorShader.g = colorShit.g; // green channel influence
    
}

function debugStatsHandler()
{
    curNumDebLabel.text = "Song Index: " + freeplaySongIndex;

    curSongDebLabel.text = "Song: " + songList[freeplaySongIndex];

    curDiffDebLabel.text = "Difficulty: " + diffList[freeplayDiffIndex];

    curScoreDebLabel.text = "Score: " + saveData.score;

    curAccuracyDebLabel.text = "Accuracy: " + FlxMath.roundDecimal(saveData.accuracy * 100, 2) +"%";

    curMissesDebLabel.text = "Misses: " + saveData.misses;

    if (saveData.date == null)
    {
        saveData.date = "N/A";
    }

    curDateDebLabel.text = "Date Achieved: " + saveData.date;


    if (devmode == true)
    {
        debugDataDebLabel.visible = true;

        curNumDebLabel.visible = true;

        curSongDebLabel.visible = true;

        curDiffDebLabel.visible = true;

        curScoreDebLabel.visible = true;

        curAccuracyDebLabel.visible = true;

        curMissesDebLabel.visible = true;

        curDateDebLabel.visible = true;
    }
    else
    {
        debugDataDebLabel.visible = false;

        curNumDebLabel.visible = false;

        curSongDebLabel.visible = false;

        curDiffDebLabel.visible = false;

        curScoreDebLabel.visible = false;

        curAccuracyDebLabel.visible = false;

        curMissesDebLabel.visible = false;

        curDateDebLabel.visible = false;
    }
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

        // scale values
        var smallScale:Float = 0.58;   // not selected
        var baseScale:Float = 0.67;   // default
        var selectedScale:Float = 0.85; // selected

        // anchor scaling to left edge
        songTags[i].origin.set(0, songTags[i].origin.y);

        if (i == freeplaySongIndex) {
            // selected card: grow bigger
            songTags[i].scale.set(
                FlxMath.lerp(songTags[i].scale.x, selectedScale, 10 * timethingidfk),
                FlxMath.lerp(songTags[i].scale.y, selectedScale, 10 * timethingidfk)
            );
            songTags[i].alpha = FlxMath.lerp(songTags[i].alpha, 1.0, 10 * timethingidfk);
        } else {
            // non-selected: shrink a little
            songTags[i].scale.set(
                FlxMath.lerp(songTags[i].scale.x, smallScale, 10 * timethingidfk),
                FlxMath.lerp(songTags[i].scale.y, smallScale, 10 * timethingidfk)
            );
            songTags[i].alpha = FlxMath.lerp(songTags[i].alpha, 0.4, 10 * timethingidfk);
        }

        // keep left aligned
        songTags[i].x = startX;
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
        new FlxTimer().start(0.3, function(tmr:FlxTimer)
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
