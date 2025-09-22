import flixel.text.FlxTextBorderStyle;
import flixel.ui.FlxBar;
import flixel.ui.FlxBarFillDirection;
import flixel.util.FlxStringUtil;
import funkin.savedata.FunkinSave;

var uitype:String = FlxG.save.data.songUI;



var timeBarBG:FunkinSprite;
var timeBar:FlxBar;
var timeTxt:FunkinText;
var psychScoreTxt:FunkinText;
var psychScoreTxtTween:FlxTween;
var ratingFC:String = "FC";
var ratingStuff:Array<Dynamic> = [
     ['You Suck!', 0.2], //From 0% to 19%
     ['Shit', 0.4], //From 20% to 39%
     ['Bad', 0.5], //From 40% to 49%
     ['Bruh', 0.6], //From 50% to 59%
     ['Meh', 0.69], //From 60% to 68%
     ['Nice', 0.7], //69%
     ['Good', 0.8], //From 70% to 79%
     ['Great', 0.9], //From 80% to 89%
     ['Sick!', 1], //From 90% to 99%
     ['Perfect!!', 1] //The value on this one isn't used actually, since Perfect is always "1"
];


function create()
{
    if (uitype == "psych")
    {
        doIconBop = false;
    }
}

function postCreate()
{
    if (uitype == "psych")
    {
        for (cneText in [scoreTxt, missesTxt, accuracyTxt]) remove(cneText);

        iconP1.origin.set(0, iconP1.height / 3);
        iconP2.origin.set(iconP2.width, iconP2.height / 3);

        timeBarBG = new FunkinSprite(0, FlxG.height * 0.02);
        timeBarBG.loadGraphic(Paths.image("game/timeBar"));
        timeBarBG.screenCenter(FlxAxes.X);
        add(timeBarBG);

        timeBar = new FlxBar(timeBarBG.x + 4, timeBarBG.y + 4, FlxBarFillDirection.LEFT_TO_RIGHT, Std.int(timeBarBG.width - 8), Std.int(timeBarBG.height - 8), inst, 'time', 0, inst.length);
        timeBar.createFilledBar(FlxColor.BLACK, FlxColor.WHITE);
        timeBar.numDivisions = timeBar.width;
        add(timeBar);

        

        timeText = new FunkinText(timeBarBG.x, timeBarBG.y + -5, Std.int(timeBarBG.width), 20);
        timeText.setFormat(Paths.font("Maplestory OTF Bold.otf"), 32, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        timeText.size = 30;
        timeText.borderSize = 2;
        timeText.screenCenter(FlxAxes.X);
        add(timeText);

        for (timeStuff in [timeBarBG, timeBar, timeText]) timeStuff.alpha = 0;

        psychScoreTxt = new FunkinText(0, 685, FlxG.width, "Score: 0 | Misses: 0 | Rating: ?");
        psychScoreTxt.setFormat(Paths.font("Maplestory OTF Bold.otf"), 18, FlxColor.WHITE, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
        psychScoreTxt.borderSize = 1.25;
        psychScoreTxt.screenCenter(FlxAxes.X);
        if (downscroll) psychScoreTxt.y = 605;
        add(psychScoreTxt);

        timeBarBG.cameras = [camHUD];
        timeBar.cameras = [camHUD];
        timeText.cameras = [camHUD];
        psychScoreTxt.cameras = [camHUD];
    }
}

function onSongStart()
{
    if (uitype == "psych")
    {
        for (timeStuff in [timeBarBG, timeBar, timeText]) FlxTween.tween(timeStuff, {alpha: 1}, 0.5, {ease: FlxEase.circOut});
    }
}

function update(elapsed:Float)
{
    if (uitype == "psych")
    {
        var mult:Float = FlxMath.lerp(1, iconP1.scale.x, FlxMath.bound(1 - (elapsed * 9), 0, 1));
        iconP1.scale.set(mult, mult);
        iconP1.updateHitbox();

        var mult:Float = FlxMath.lerp(1, iconP2.scale.x, FlxMath.bound(1 - (elapsed * 9), 0, 1));
        iconP2.scale.set(mult, mult);
        iconP2.updateHitbox();

        if (inst != null && timeBar != null && timeBar.max != inst.length) {
            timeBar.setRange(0, Math.max(1, inst.length));
        }

        if (inst != null && timeText != null) {
            var timeRemaining = Std.int((inst.length - Conductor.songPosition) / 1000);
            var seconds = CoolUtil.addZeros(Std.string(timeRemaining % 60), 2);
            var minutes = Std.int(timeRemaining / 60);
            timeText.text = minutes + ":" + seconds;
        }
        var psychAccuracy = FlxMath.roundDecimal(Math.max(accuracy, 0) * 100, 2);
        var rating:String = getRating(accuracy);
        getRatingFC(accuracy, misses);
        if (songScore > 0 || psychAccuracy > 0 || misses > 0) psychScoreTxt.text = "Score: " + songScore + " | Misses: " + misses +  " | Rating: " + rating + " | " + "(" + psychAccuracy + "%) - " + ratingFC;
    }

}

function beatHit()
{
    if (uitype == "psych")
    {
        iconP1.scale.set(1.2, 1.2);
        iconP2.scale.set(1.2, 1.2);

        iconP1.updateHitbox();
        iconP2.updateHitbox();
    }
}

function onPlayerHit(note:Note) {
    if (uitype == "psych")
    {
        if (!note.isSustainNote)
        {
            if(psychScoreTxtTween != null) psychScoreTxtTween.cancel();

            psychScoreTxt.scale.x = 1.075;
            psychScoreTxt.scale.y = 1.075;
            psychScoreTxtTween = FlxTween.tween(psychScoreTxt.scale, {x: 1, y: 1}, 0.2, {
                onComplete: function(twn:FlxTween) {
                    psychScoreTxtTween = null;
                }
            });
        }
    }
}

function getRating(ratingAccuracy:Float):String
{
    if (uitype == "psych")
    {
        if (ratingAccuracy < 0) return "?";

        for (rating in ratingStuff) if (ratingAccuracy < rating[1]) return rating[0];
        return ratingStuff[ratingStuff.length - 1][0];
    }
}

function getRatingFC(accuracy:Float, misses:Int):String
{
    if (uitype == "psych")
    {
        if (misses == 0) if (accuracy == 1.0) ratingFC = "SFC" else if (accuracy >= 0.99) ratingFC = "GFC" else ratingFC = "FC";

        if (misses > 0) if (misses < 10) ratingFC = "SDCB" else if (misses >= 10) ratingFC = "Clear";
    }
}
