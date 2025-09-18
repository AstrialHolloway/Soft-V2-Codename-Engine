import haxe.xml.Access;

// Var things
var songThing = "repressed";

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
	"noneend", 
	"12end", 
	"noneend", 
	"beep", 
	"13end", 
	"14end"
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
		bgEdit("spooky-room");
		
	}
	if (voiceNumShit == 14)
	{
		bgEdit("lowtiergod");
		bgSprite1.scale.set(0.5,0.5);
		bgSprite1.updateHitbox();
		
	}
	if (voiceNumShit == 15)
	{
		bgEdit("spooky-room");
		bgSprite1.scale.set(1,1);
		bgSprite1.updateHitbox();
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	
	if (curVoiceline != null) curVoiceline.stop();
	
	if (voiceNumShit != 12 && voiceNumShit != 14)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	if (voiceNumShit == 14)
	{
		curVoiceline = FlxG.sound.play(Paths.sound("dio/sounds/lowtiergod"));
	}
	
	
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
}