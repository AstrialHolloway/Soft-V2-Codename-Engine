import funkin.savedata.FunkinSave;

var splashes:Bool = FlxG.save.data.noteSplashes;

function onPlayerHit(e) 
{
    if (splashes == false)
    {
        e.showSplash = false;
    }
}