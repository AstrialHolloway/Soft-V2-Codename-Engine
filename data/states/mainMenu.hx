import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.menus.credits.CreditsMain;

static var mainMenuIndex = 0;

var switching = false;

var bgSprite:FunkinSprite = new FunkinSprite(-319,-180);
bgSprite.loadGraphic(Paths.image("menus/mainmenu/bg"));
bgSprite.scale.set(0.67, 0.67);
add(bgSprite);

var mainMenuText:FunkinSprite = new FunkinSprite(393,-33);
mainMenuText.frames = Paths.getSparrowAtlas("menus/mainmenu/items/story_mode");
mainMenuText.animation.addByPrefix("basic", "story_mode0000", 24, true);
mainMenuText.animation.addByPrefix("sel", "story_mode0001", 24, false);
mainMenuText.animation.play("sel");
mainMenuText.scale.set(0.67,0.67);
add(mainMenuText);

var freeplayText:FunkinSprite = new FunkinSprite(455,140);
freeplayText.frames = Paths.getSparrowAtlas("menus/mainmenu/items/freeplay");
freeplayText.animation.addByPrefix("basic", "freeplay0000", 24, true);
freeplayText.animation.addByPrefix("sel", "freeplay0001", 24, false);
freeplayText.animation.play("basic");
freeplayText.scale.set(0.67,0.67);
add(freeplayText);

var optionsText:FunkinSprite = new FunkinSprite(501,335);
optionsText.frames = Paths.getSparrowAtlas("menus/mainmenu/items/options");
optionsText.animation.addByPrefix("basic", "options0000", 24, true);
optionsText.animation.addByPrefix("sel", "options0001", 24, false);
optionsText.animation.play("basic");
optionsText.scale.set(0.67,0.67);
add(optionsText);

var creditsText:FunkinSprite = new FunkinSprite(503,478);
creditsText.frames = Paths.getSparrowAtlas("menus/mainmenu/items/credits");
creditsText.animation.addByPrefix("basic", "credits0000", 24, true);
creditsText.animation.addByPrefix("sel", "credits0001", 24, false);
creditsText.animation.play("basic");
creditsText.scale.set(0.67,0.67);
add(creditsText);

var fgSprite:FunkinSprite = new FunkinSprite(-319,-180);
fgSprite.loadGraphic(Paths.image("menus/mainmenu/fg"));
fgSprite.scale.set(0.67, 0.67);
add(fgSprite);

import data.GlobalVars;


var transCoverState:FunkinSprite = new FunkinSprite(0,0);
transCoverState.frames = Paths.getSparrowAtlas("transition/regular");
transCoverState.animation.addByPrefix("in", "transitionIn", 35, false);
transCoverState.animation.addByPrefix("out", "transitionOut", 35, false);
transCoverState.animation.addByPrefix("empty", "empty", 35, true);
transCoverState.animation.addByPrefix("full", "full", 35, true);
transCoverState.color = 0x000000;

transCoverState.scale.set(1,1);
add(transCoverState);

var transCoverPlay:FunkinSprite = new FunkinSprite(0,0);
transCoverPlay.frames = Paths.getSparrowAtlas("transition/playstate");
transCoverPlay.animation.addByPrefix("in", "transitionIn", 35, false);
transCoverPlay.animation.addByPrefix("out", "transitionOut", 35, false);
transCoverPlay.animation.addByPrefix("empty", "empty", 35, true);
transCoverPlay.animation.addByPrefix("full", "full", 35, true);

transCoverPlay.scale.set(1,1);
add(transCoverPlay);


function create()
{
    
}


function update()
{
    CoolUtil.playMenuSong();
    if (switching == false)
    {
        handleInputs();
        handleMenuItems();
    }
    
}

function handleInputs()
{
    if (controls.BACK)
    {

        FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
        switching = true;
        transtype = "state";
        
        new FlxTimer().start(0.5, function(tmr:FlxTimer)
        {
            
            
            FlxG.switchState(new TitleState());
                
        });
    }
    if (controls.ACCEPT)
    {
        FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
        switching = true;
        transtype = "state";
        
        new FlxTimer().start(1, function(tmr:FlxTimer)
        {
            
            menuOpen();    
            
        });
    }
    if (controls.UP_P)
    {
        mainMenuIndex--;
        if (mainMenuIndex < 0)
        {
            mainMenuIndex = 3;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        
        
    }
    if (controls.DOWN_P)
    {
        mainMenuIndex++;
        if (mainMenuIndex > 3)
        {
            mainMenuIndex = 0;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        
        
    }
    

    if (controls.SWITCHMOD) {
        if(controls.SWITCHMOD)
    {
        persistentUpdate = !(persistentDraw = true);
		openSubState(new ModSwitchMenu());
    }
    }
    if (controls.DEV_ACCESS) {
        persistentUpdate = !(persistentDraw = true);
		openSubState(new EditorPicker());
    }
}



function handleMenuItems()
{
    if (mainMenuIndex == 0)
    {
        mainMenuText.animation.play("sel");
    }
    else
    {
        mainMenuText.animation.play("basic");
    }
    if (mainMenuIndex == 1)
    {
        freeplayText.animation.play("sel");
    }
    else
    {
        freeplayText.animation.play("basic");
    }
    if (mainMenuIndex == 2)
    {
        optionsText.animation.play("sel");
    }
    else
    {
        optionsText.animation.play("basic");
    }
    if (mainMenuIndex == 3)
    {
        creditsText.animation.play("sel");
    }
    else
    {
        creditsText.animation.play("basic");
    }
        
}

function menuOpen()
{
    if (mainMenuIndex == 0) 
    {
        FlxG.switchState(new StoryMenuState());
    }
    if (mainMenuIndex == 1) 
    {
        FlxG.switchState(new FreeplayState());
    }
    if (mainMenuIndex == 2) 
    {
        FlxG.switchState(new OptionsMenu());
    }
    if (mainMenuIndex == 3) 
    {
        FlxG.switchState(new ModState('credits'));
    }
}
