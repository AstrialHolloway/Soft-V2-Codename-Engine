import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.menus.credits.CreditsMain;

CoolUtil.playMusic("music/softCredits.ogg");

var creditsIndex = 0;

// Create two copies of the background
var bg1:FunkinSprite = new FunkinSprite(0, 0);
bg1.loadGraphic(Paths.image("menus/credits/background"));
bg1.scale.set(0.67, 0.67);
bg1.updateHitbox();
add(bg1);

var bg2:FunkinSprite = new FunkinSprite(bg1.width, 0); // place right after bg1
bg2.loadGraphic(Paths.image("menus/credits/background"));
bg2.scale.set(0.67, 0.67);
bg2.updateHitbox();
add(bg2);

var board:FunkinSprite = new FunkinSprite(0, 0); // place right after bg1
board.loadGraphic(Paths.image("menus/credits/panels/1"));
board.scale.set(0.67, 0.67);
board.updateHitbox();
add(board);

var footer:FunkinSprite = new FunkinSprite(0, 650); // place right after bg1
footer.loadGraphic(Paths.image("menus/credits/footer"));
footer.scale.set(0.67, 0.67);
footer.updateHitbox();
add(footer);

var changeLabel = new FlxText(200, 675, 1000, 'PRESS "C" TO SWITCH TO CODENAME CREDITS', 10);
changeLabel.setFormat(Paths.font("MochiyPopOne-Regular.ttf"), 20, FlxColor.WHITE, "center");
add(changeLabel);

// Flash on/off every 0.5 seconds


var arrowLeft:FunkinSprite = new FunkinSprite(20, 290); // place right after bg1
arrowLeft.loadGraphic(Paths.image("menus/credits/arrowL"));
arrowLeft.scale.set(0.67, 0.67);
arrowLeft.updateHitbox();
add(arrowLeft);

var arrowRight:FunkinSprite = new FunkinSprite(1190, 290); // place right after bg1
arrowRight.loadGraphic(Paths.image("menus/credits/arrowR"));
arrowRight.scale.set(0.67, 0.67);
arrowRight.updateHitbox();
add(arrowRight);




// Scroll speed
var scrollSpeed:Float = 20; // pixels per second

var boardList:Array<String> =
[
    "Artist P1",
    "Artist P2",
    "Musicians",
    "Voice Actors",
    "Coder, Charters, Writers",
    "Translations",
    "Creators",
    "Special Thanks"
];
var boards:Array<String> =
[
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8"
];
var transitioning = false;

trace("Current Credits Build Board:" + boardList[creditsIndex]);

function update(elapsed:Float)
{
    board.loadGraphic(Paths.image("menus/credits/panels/"+boards[creditsIndex]));
    board.updateHitbox();
    handleInputs();
    // Move both backgrounds
    bg1.x -= scrollSpeed * elapsed;
    bg2.x -= scrollSpeed * elapsed;

    // Wrap around when fully off-screen
    if (bg1.x + bg1.width <= 0)
        bg1.x = bg2.x + bg2.width;

    if (bg2.x + bg2.width <= 0)
        bg2.x = bg1.x + bg1.width;
}


function handleInputs()
{
    if (controls.LEFT_P)
    {
        if (transitioning == false)
        {
            creditsIndex--;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
            if (creditsIndex < 0)
            {
                creditsIndex = 7;
            }
            
            trace("Current Credits Build Board:" + boardList[creditsIndex]);
        }
        
    }
    if (controls.RIGHT_P)
    {
        if (transitioning == false)
        {
            creditsIndex++;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);

            if (creditsIndex > 7)
            {
                creditsIndex = 0;
            }
            trace("Current Credits Build Board:" + boardList[creditsIndex]);
        }
        
    }
    if (controls.BACK)
    {
        FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
        transitioning=true;
        new FlxTimer().start(0.3, function(tmr:FlxTimer)
        {
            FlxG.switchState(new MainMenuState());
            
        });
    }
    if (FlxG.keys.justPressed.C)
    {
        FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
        transitioning=true;
        new FlxTimer().start(2.2, function(tmr:FlxTimer)
        {
            FlxG.switchState(new CreditsMain());
            
        });
        new FlxTimer().start(0.1, function(tmr:FlxTimer)
        {
            changeLabel.visible = !changeLabel.visible; // toggle
        }, 11);
    }
    
}