import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.menus.credits.CreditsMain;
import haxe.xml.Access;
import flixel.util.typeLimit.OneOfThree;
import funkin.editors.ui.UIState;

static var settingsMenuIndex = 0;

var switching = false;

var bgSprite:FunkinSprite = new FunkinSprite(-319,-180);
bgSprite.loadGraphic(Paths.image("menus/options/bg"));
bgSprite.scale.set(0.67, 0.67);
add(bgSprite);



var noteColorsSprite:FunkinSprite = new FunkinSprite(535,-40);
noteColorsSprite.loadGraphic(Paths.image("menus/options/Note Colors"));
noteColorsSprite.scale.set(0.67, 0.67);
noteColorsSprite.visible = false;
add(noteColorsSprite);

var controlsSprite:FunkinSprite = new FunkinSprite(825,23);
controlsSprite.loadGraphic(Paths.image("menus/options/Controls"));
controlsSprite.scale.set(0.67, 0.67);
add(controlsSprite);

var adjustDelayandComboSprite:FunkinSprite = new FunkinSprite(-5,155);
adjustDelayandComboSprite.loadGraphic(Paths.image("menus/options/Adjust Delay and Combo"));
adjustDelayandComboSprite.scale.set(0.67, 0.67);
adjustDelayandComboSprite.visible = false;
add(adjustDelayandComboSprite);

var graphicsSprite:FunkinSprite = new FunkinSprite(281,254);
graphicsSprite.loadGraphic(Paths.image("menus/options/Graphics"));
graphicsSprite.scale.set(0.67, 0.67);
add(graphicsSprite);

var visualsandUISprite:FunkinSprite = new FunkinSprite(-20,405);
visualsandUISprite.loadGraphic(Paths.image("menus/options/Visuals and UI"));
visualsandUISprite.scale.set(0.67, 0.67);
add(visualsandUISprite);

var gameplaySprite:FunkinSprite = new FunkinSprite(760,405);
gameplaySprite.loadGraphic(Paths.image("menus/options/Gameplay"));
gameplaySprite.scale.set(0.67, 0.67);
add(gameplaySprite);

var fgSprite:FunkinSprite = new FunkinSprite(-319,-180);
fgSprite.loadGraphic(Paths.image("menus/options/fg"));
fgSprite.scale.set(0.67, 0.67);
add(fgSprite);



function update()
{
    CoolUtil.playMenuSong();
    if (switching == false)
    {
        handleInputs();
        handleOptionItems();
    }
    
}

function handleInputs()
{
    if (controls.BACK)
    {
        FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
        new FlxTimer().start(0.3, function(tmr:FlxTimer)
        {
            
            FlxG.switchState(new MainMenuState());
                
        });
    }
    if (controls.ACCEPT)
    {
        FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
        openSub();    
    }
    if (controls.UP_P)
    {
        settingsMenuIndex--;
        if (settingsMenuIndex < 0)
        {
            settingsMenuIndex = 3;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        
        
    }
    if (controls.DOWN_P)
    {
        settingsMenuIndex++;
        if (settingsMenuIndex > 3)
        {
            settingsMenuIndex = 0;
        }
        FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        
        
    }
    

    
}

function handleOptionItems()
{
    if (settingsMenuIndex == 0)
    {
        controlsSprite.visible = true;
    }
    else
    {
        controlsSprite.visible = false;
    }
    if (settingsMenuIndex == 1 )
    {
        graphicsSprite.visible = true;
    }
    else
    {
        graphicsSprite.visible = false;
    }
    if (settingsMenuIndex == 2 )
    {
        visualsandUISprite.visible = true;
    }
    else
    {
        visualsandUISprite.visible = false;
    }
    if (settingsMenuIndex == 3 )
    {
        gameplaySprite.visible = true;
    }
    else
    {
        gameplaySprite.visible = false;
    }
        
}

function openSub()
{
    if (mainMenuIndex == 0) 
    {
        openSubState(substate());
    }
    if (mainMenuIndex == 1) 
    {
        openSubState(substate());
    }
    if (mainMenuIndex == 2) 
    {
        openSubState(substate());
    }
    if (mainMenuIndex == 3) 
    {
        openSubState(substate(GameplayOptions));
    }
}
