import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.ui.FlxBarFillDirection;
import flixel.util.FlxStringUtil;
import funkin.savedata.FunkinSave;

function postCreate()
{
    customHBBG = new FunkinSprite(0,597);
    customHBBG.loadGraphic(Paths.image("game/bar"));
    customHBBG.screenCenter(FlxAxes.X);
    insert(members.indexOf(iconP1) - 1, customHBBG);
    add(customHBBG);
    customHBBG.cameras = [camHUD];
}