import haxe.xml.Access;

// Var things
var songThing = "it's-complicated";

var curVoiceline;

var dialogueFilePath = "dio/sounds/" + songThing + "/";

var voiceNumShit = -1;

var bgSpriteTraceShit;

var dioList:Array<String> = 
[
    "1end",
    "2end", 
	"3end", 
	"4end", 
	"5end", 
	"6end",
	"7end", 
	"8end", 
	"9end", 
	"10end", 
	"11end", 
	"12end", 
	"13end", 
	"14end", 
	"honk", 
	"15end", 
	"16end", 
	"17end"
];

//BG Sprite
var bgSprite1:FunkinSprite = new FunkinSprite(0,0);
insert(members.indexOf = 1, bgSprite1);
add(bgSprite1);

// Functions
function bgEdit(sprite)
{	
	bgSprite1.loadGraphic(Paths.image("dialogue/backgrounds/"+sprite));
	bgSpriteTraceShit = sprite;
	trace("Background sprite set to: " + '"' +bgSpriteTraceShit + '"');
}

function postNext(event)
{
	handleVoices();
	trace(curLine.char + " says: " + curLine.text);
	if (voiceNumShit == 0)
	{
		bgEdit("station");
		dialogueBox.visible = true;
	}
	if (voiceNumShit == 14)
	{
		bgEdit("car-pullup");
		bgSprite1.scale.set(0.667,0.667);
		bgSprite1.updateHitbox();
		trace("sprite made: Station");
		dialogueBox.visible = false;
	}
	if (voiceNumShit == 15)
	{
		bgEdit("station");
		bgSprite1.scale.set(1,1);
		bgSprite1.updateHitbox();
		trace("sprite made: Station");
		dialogueBox.visible = true;
	}
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	
	curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
}