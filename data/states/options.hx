import funkin.options.OptionsMenu;
import funkin.editors.EditorPicker;
import funkin.menus.ModSwitchMenu;
import funkin.menus.credits.CreditsMain;
import haxe.xml.Access;
import flixel.util.typeLimit.OneOfThree;
import funkin.editors.ui.UIState;
import funkin.options.keybinds.KeybindsOptions;

import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.ui.FlxBarFillDirection;
import flixel.util.FlxStringUtil;
import funkin.savedata.FunkinSave;

FunkinSave.load();



static var settingsMenuIndex = 0;

var settingsGraphicsMenuIndex = 0;

var settingsGameplayMenuIndex = 0;

var settingsvisualsandUIMenuIndex = 0;

var switching = false;

var settingsOpened = false;

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

changeLabel = new FunkinText(140, 0, 1000, 'PRESS "O" TO OPEN CODENAME OPTIONS');
changeLabel.setFormat(Paths.font("Maplestory OTF Bold.otf"), 50, 0x3b5a75, "center", FlxTextBorderStyle.OUTLINE, 0x173651);
changeLabel.size = 30;
changeLabel.borderSize = 5;
add(changeLabel);

var optionsBG:FlxSprite = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
optionsBG.visible=false;
optionsBG.alpha=0.4;
add(optionsBG);

var graphicsOptionsList:Array<Dynamic> = [
    { "name": "Flashing Menu", "optionID": "flashingMenu", "type": "checkbox", "id": 0 },
    { "name": "Colored Healthbar", "optionID": "colorHealthBar", "type": "checkbox", "id": 1 },
    { "name": "Pixel Perfect Effect", "optionID": "week6PixelPerfect", "type": "checkbox", "id": 2 }
];

var graphicsTags:Array<Alphabet> = []; // make sure it's typed as Alphabet
var graphicsIcons:Array<FlxSprite> = [];


var startX:Float = 30;
var startY:Float = 200; // center-ish point on screen
var spacing:Float = 120;
var scrollSpeed:Float = 6;

for (i in 0...graphicsOptionsList.length) {
    var option = graphicsOptionsList[i];
    var graphicsText:Alphabet = new Alphabet(startX, startY + (i * spacing), graphicsOptionsList[i].name, "bold");
    graphicsText.alpha = 0.8;
    graphicsText.color = 0xc7c7c7;
    graphicsText.antialiasing = true;
    graphicsText.scale.set(1,1);
    add(graphicsText);

    graphicsTags.push(graphicsText);

    var icon:FlxSprite = new FlxSprite(graphicsText.x + graphicsText.width + 20, graphicsText.y);
    
    switch(option.type) {
        
        case "checkbox":
            icon.frames = Paths.getSparrowAtlas("menus/options/checkboxThingie"); // put your atlas path
            icon.animation.addByPrefix("static sel", "Check Box Selected Static", 24, true);
            icon.animation.addByPrefix("selecting", "Check Box selecting animation", 24, false);
            icon.animation.addByPrefix("deselect", "Check Box deselect animation", 24, false);
            icon.animation.addByPrefix("static not sel", "Check Box unselected", 24, true);
            icon.animation.play("static sel");
            icon.scale.set(0.6, 0.6);
            icon.updateHitbox();

        // ✅ Decide which animation to start with
            var savedVal:Bool = Reflect.field(FlxG.save.data, option.optionID) == true;
            var isChecked:Bool = Reflect.field(Options, option.optionID) == true;
            if (savedVal || isChecked)
                icon.animation.play("static sel");
            else
                icon.animation.play("static not sel");

            icon.scale.set(0.6, 0.6);
            icon.updateHitbox();
    }

    add(icon);
    graphicsIcons.push(icon);
}

var graphicsTitleText:Alphabet = new Alphabet(830, 5, "Graphics", "bold");
graphicsTitleText.antialiasing = true;
graphicsTitleText.scale.set(1.1,1.1);
graphicsTitleText.updateHitbox();
graphicsTitleText.visible=false;
add(graphicsTitleText);


for (tag in graphicsTags)
{
    tag.visible = false;
}

for (tag in graphicsIcons)
{
    tag.visible = false;
}

var gameplayOptionsList:Array<Dynamic> = 
[
    {"name": "Downscroll", "optionID": "downscroll", "type": "checkbox", "id": 0},
    {"name": "Ghost Tapping", "optionID": "ghostTapping", "type": "checkbox", "id": 1},
    {"name": "Naughtyness", "optionID": "naughtyness", "type": "checkbox", "id": 2},
    {"name": "Camera Zoom On Beat", "optionID": "camZoomOnBeat", "type": "checkbox", "id": 3}
];

var gameplayTags:Array<Alphabet> = []; // make sure it's typed as Alphabet
var gameplayIcons:Array<FlxSprite> = [];

var startX:Float = 30;
var startY:Float = 200; // center-ish point on screen
var spacing:Float = 120;
var scrollSpeed:Float = 6;

for (i in 0...gameplayOptionsList.length) {
    var option = gameplayOptionsList[i];
    
    var gameplayText:Alphabet = new Alphabet(startX, startY + (i * spacing), gameplayOptionsList[i].name, "bold");
    gameplayText.alpha = 0.8;
    gameplayText.color = 0xc7c7c7;
    gameplayText.antialiasing = true;
    gameplayText.scale.set(1,1);
    add(gameplayText);

    gameplayTags.push(gameplayText);
    // Sprite based on type
    var icon:FlxSprite = new FlxSprite(gameplayText.x + gameplayText.width + 20, gameplayText.y);
    
    switch(option.type) {
        case "checkbox":
            icon.frames = Paths.getSparrowAtlas("menus/options/checkboxThingie"); // put your atlas path
            icon.animation.addByPrefix("static sel", "Check Box Selected Static", 24, true);
            icon.animation.addByPrefix("selecting", "Check Box selecting animation", 24, false);
            icon.animation.addByPrefix("deselect", "Check Box deselect animation", 24, false);
            icon.animation.addByPrefix("static not sel", "Check Box unselected", 24, true);
            icon.animation.play("static sel");
            icon.scale.set(0.6, 0.6);
            icon.updateHitbox();

        // ✅ Decide which animation to start with
            var savedVal:Bool = Reflect.field(FlxG.save.data, option.optionID) == true;
            var isChecked:Bool = Reflect.field(Options, option.optionID) == true;
            if (savedVal || isChecked)
                icon.animation.play("static sel");
            else
                icon.animation.play("static not sel");

            icon.scale.set(0.6, 0.6);
            icon.updateHitbox();
    }

    add(icon);
    gameplayIcons.push(icon);
}

var gameplayTitleText:Alphabet = new Alphabet(830, 5, "Gameplay", "bold");
gameplayTitleText.antialiasing = true;
gameplayTitleText.scale.set(1.1,1.1);
gameplayTitleText.updateHitbox();
gameplayTitleText.visible=false;
add(gameplayTitleText);


for (tag in gameplayTags)
{
    tag.visible = false;
}

for (tag in gameplayIcons)
{
    tag.visible = false;
}

var visualsandUIOptionsList:Array<Dynamic> = 
[
    {"name": "Note Splashes", "optionID": "noteSplashes", "type": "checkbox" , "id": 0},
    {"name": "Hide Hud", "optionID": "ghostTapping", "type": "checkbox" , "id": 1},
    {"name": "Soft Transitions", "optionID": "softTrans", "type": "checkbox" , "id": 2},
    {"name": "Flashing Lights", "optionID": "flashingLights", "type": "checkbox" , "id": 3},
    {"name": "Camera Zoom On Beat", "optionID": "camZoomOnBeat", "type": "checkbox" , "id": 4},
    {"name": "Combo Milestone", "optionID": "comboMilestone", "type": "checkbox" , "id": 5},
    {"name": "Colored Combo", "optionID": "coloredCombo", "type": "checkbox" , "id": 6}
];



var visualsandUITags:Array<Alphabet> = []; // make sure it's typed as Alphabet
var visualsandUIIcons:Array<FlxSprite> = [];

var startX:Float = 30;
var startY:Float = 200; // center-ish point on screen
var spacing:Float = 120;
var scrollSpeed:Float = 6;

for (i in 0...visualsandUIOptionsList.length) {
    var option = visualsandUIOptionsList[i];

    // Text label
    var visualsandUIText:Alphabet = new Alphabet(startX, startY + (i * spacing), option.name, "bold");
    visualsandUIText.alpha = 0.8;
    visualsandUIText.color = 0xc7c7c7;
    visualsandUIText.antialiasing = true;
    visualsandUIText.scale.set(1,1);
    add(visualsandUIText);
    visualsandUITags.push(visualsandUIText);

    // Icon
    var icon:FlxSprite = new FlxSprite(visualsandUIText.x + visualsandUIText.width + 20, visualsandUIText.y);
    switch(option.type) {
        case "checkbox":
            icon.frames = Paths.getSparrowAtlas("menus/options/checkboxThingie");
            icon.animation.addByPrefix("static sel", "Check Box Selected Static", 24, true);
            icon.animation.addByPrefix("selecting", "Check Box selecting animation", 24, false);
            icon.animation.addByPrefix("deselect", "Check Box deselect animation", 24, false);
            icon.animation.addByPrefix("static not sel", "Check Box unselected", 24, true);

            // ✅ Decide which animation to start with
            var savedVal:Bool = Reflect.field(FlxG.save.data, option.optionID) == true;
            var isChecked:Bool = Reflect.field(Options, option.optionID) == true;
            if (savedVal || isChecked)
                icon.animation.play("static sel");
            else
                icon.animation.play("static not sel");

            icon.scale.set(0.6, 0.6);
            icon.updateHitbox();
    }

    add(icon);
    visualsandUIIcons.push(icon);
}





var visualsUITitleText:Alphabet = new Alphabet(730, 5, "Visuals & UI", "bold");
visualsUITitleText.antialiasing = true;
visualsUITitleText.scale.set(0.9,0.9);
visualsUITitleText.updateHitbox();
visualsUITitleText.visible=false;
add(visualsUITitleText);

for (tag in visualsandUITags)
{
    tag.visible = false;
}

for (tag in visualsandUIIcons)
{
    tag.visible = false;
}



var curSettingOpened = null;

function update(elapsed:Float)
{
    
    CoolUtil.playMenuSong();
    if (switching == false)
    {
        handleInputs();
        handleOptionItems();
    } 
    for (i in 0...graphicsTags.length)
    {
        var text = graphicsTags[i];
        var icon = graphicsIcons[i]; // get the matching icon

        // Calculate target Y based on index relative to selection
        var targetY:Float = startY + ((i - settingsGraphicsMenuIndex) * spacing);
        

        // Smoothly move toward target Y
        text.y = FlxMath.lerp(text.y, targetY, scrollSpeed * elapsed);
        icon.y = FlxMath.lerp(icon.y, targetY, scrollSpeed * elapsed);

        // Highlight selected option
        if (i == settingsGraphicsMenuIndex)
        {
            text.color = 0xffffff;
            text.alpha = 1;
            icon.alpha = 1;
        }
        else
        {
            text.color = 0xc7c7c7;
            text.alpha = 0.8;
            icon.alpha = 0.8;
        }
    }
    for (i in 0...gameplayTags.length)
    {
        var text = gameplayTags[i];
        var icon = gameplayIcons[i]; // get the matching icon

        // Calculate target Y based on index relative to selection
        var targetY:Float = startY + ((i - settingsGameplayMenuIndex) * spacing);

        // Smoothly move toward target Y
        text.y = FlxMath.lerp(text.y, targetY, scrollSpeed * elapsed);
        icon.y = FlxMath.lerp(icon.y, targetY, scrollSpeed * elapsed);

        // Keep icon next to text
        icon.x = text.x + text.width + 20;

        // Highlight selected option
        if (i == settingsGameplayMenuIndex)
        {
            text.color = 0xffffff;
            text.alpha = 1;
            icon.alpha = 1;
        }
        else
        {
            text.color = 0xc7c7c7;
            text.alpha = 0.8;
            icon.alpha = 0.8;
        }
        
    }
    for (i in 0...visualsandUITags.length)
    {
        var text = visualsandUITags[i];
        var icon = visualsandUIIcons[i]; // get the matching icon

        // Calculate target Y based on index relative to selection
        var targetY:Float = startY + ((i - settingsvisualsandUIMenuIndex) * spacing);

        // Smoothly move toward target Y
        text.y = FlxMath.lerp(text.y, targetY, scrollSpeed * elapsed);
        icon.y = FlxMath.lerp(icon.y, targetY, scrollSpeed * elapsed);

        // Keep icon next to text
        icon.x = text.x + text.width + 20;

        // Highlight selected option
        if (i == settingsvisualsandUIMenuIndex)
        {
            text.color = 0xffffff;
            text.alpha = 1;
            icon.alpha = 1;
        }
        else
        {
            text.color = 0xc7c7c7;
            text.alpha = 0.8;
            icon.alpha = 0.8;
        }
    }
    
}

function handleInputs()
{
    if (controls.BACK)
    {
        if (settingsOpened == false)
        {  
            FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
            new FlxTimer().start(0.3, function(tmr:FlxTimer)
            {
                FlxG.switchState(new MainMenuState());
            });
        }
        else
        {
            FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
            optionsThing(false,"noteColor");
            settingsOpened = false;
            settingsGraphicsMenuIndex = 0;
            settingsGameplayMenuIndex = 0;
            settingsvisualsandUIMenuIndex = 0;
        }
    }
    if (controls.ACCEPT)
    {
        if (settingsOpened == false)
        {
            if (settingsOpened == false)
            {
                FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
                openSub();    
                settingsOpened = true;
            }
        }
    }
    if (controls.UP_P)
    {
        if (settingsOpened == false)
        {
            settingsMenuIndex--;
            if (settingsMenuIndex < 0)
            {
                settingsMenuIndex = 3;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
        if (curSettingOpened == "graphics")
        {
            settingsGraphicsMenuIndex--;
            if (settingsGraphicsMenuIndex < 0)
            {
                settingsGraphicsMenuIndex = graphicsOptionsList.length-1;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
        if (curSettingOpened == "gameplay")
        {
            settingsGameplayMenuIndex--;
            if (settingsGameplayMenuIndex < 0)
            {
                settingsGameplayMenuIndex = gameplayOptionsList.length-1;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
        if (curSettingOpened == "visualsandUI")
        {
            settingsvisualsandUIMenuIndex--;
            if (settingsvisualsandUIMenuIndex < 0)
            {
                settingsvisualsandUIMenuIndex = visualsandUIOptionsList.length-1;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
    }
    if (controls.DOWN_P)
    {
        if (settingsOpened == false)
        {
            settingsMenuIndex++;
            if (settingsMenuIndex > 3)
            {
                settingsMenuIndex = 0;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
        if (curSettingOpened == "graphics")
        {
            settingsGraphicsMenuIndex++;
            if (settingsGraphicsMenuIndex > graphicsOptionsList.length-1)
            {
                settingsGraphicsMenuIndex = 0;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
        if (curSettingOpened == "gameplay")
        {
            settingsGameplayMenuIndex++;
            if (settingsGameplayMenuIndex > gameplayOptionsList.length-1)
            {
                settingsGameplayMenuIndex = 0;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
        if (curSettingOpened == "visualsandUI")
        {
            settingsvisualsandUIMenuIndex++;
            if (settingsvisualsandUIMenuIndex > visualsandUIOptionsList.length-1)
            {
                settingsvisualsandUIMenuIndex = 0;
            }
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
        }
    }

    

    if (FlxG.keys.justPressed.O)
    {
        FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
        transitioning=true;
        new FlxTimer().start(2.2, function(tmr:FlxTimer)
        {
            FlxG.switchState(new OptionsMenu());
            
        });
        new FlxTimer().start(0.1, function(tmr:FlxTimer)
        {
            changeLabel.visible = !changeLabel.visible; // toggle
        }, 11);
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
    
    if (settingsMenuIndex == 0) 
    {
        openSubState(new KeybindsOptions());
    }
    if (settingsMenuIndex == 1) 
    {
        optionsThing(true, "Graphics");
        
    }
    if (settingsMenuIndex == 2) 
    {
        optionsThing(true, "Visuals and UI");
    }
    if (settingsMenuIndex == 3) 
    {
		optionsThing(true, "Gameplay");
    }
}





function optionsThing(active:Bool, menu:String)
{
    
    if (active == true)
    {
        optionsBG.visible=true;
        if (menu == "Graphics")
        {
            for (tag in graphicsTags)
            {
                tag.visible = true;
            }
            curSettingOpened = "graphics";
            graphicsTitleText.visible=true;
            for (tag in graphicsIcons)
            {
                tag.visible = true;
            }
        }

        if (menu == "Gameplay")
        {
            for (tag in gameplayTags)
            {
                tag.visible = true;
            }
            curSettingOpened = "gameplay";
            gameplayTitleText.visible=true;
            for (tag in gameplayIcons)
            {
                tag.visible = true;
            }
        }

        if (menu == "Visuals and UI")
        {
            for (tag in visualsandUITags)
            {
                tag.visible = true;
            }
            curSettingOpened = "visualsandUI";
            visualsUITitleText.visible=true;
            for (tag in visualsandUIIcons)
            {
                tag.visible = true;
            }
            
            
        }
            
        
    }
    if (active == false)
    {
        
        optionsBG.visible=false;
        for (tag in graphicsTags)
        {
            tag.visible = false;
        }
        for (tag in graphicsIcons)
        {
            tag.visible = false;
        }

        for (tag in gameplayTags)
        {
            tag.visible = false;
        }
        for (tag in gameplayIcons)
        {
            tag.visible = false;
        }

        for (tag in visualsandUITags)
        {
            tag.visible = false;
        }
        for (tag in visualsandUIIcons)
        {
            tag.visible = false;
        }
        graphicsTitleText.visible=false;
        gameplayTitleText.visible=false;
        visualsUITitleText.visible=false;
    }
}
