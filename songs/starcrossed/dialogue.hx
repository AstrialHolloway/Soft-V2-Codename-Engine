

// outside of all functions
var curVoiceline;

var dialogueFilePath = "dio/sounds/starcrossed/";

var voiceNumShit = -1;

var bgSpriteTraceShit;



var dioList:Array<String> = 
[
    "1",
    "2", 
	"3", 
	"4", 
	"5", 
	"6", 
	"7", 
	"8", 
	"9", 
	"10", 
	"11", 
	"12", 
	"13", 
	"none", 
	"14", 
	"15", 
	"16", 
	"17", 
	"18", 
	"19", 
	"20", 
	"21", 
	"22", 
    "23"
];

var bgSprite1:FunkinSprite = new FunkinSprite(0,0);

insert(members.indexOf = 1, bgSprite1);
add(bgSprite1);

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
		bgEdit("intro");
		bgSprite1.scale.set(0.667,0.667);
		bgSprite1.updateHitbox();
		
	}
	if (voiceNumShit == 7)
	{
		bgEdit("alleyway");
		bgSprite1.scale.set(1,1);
		bgSprite1.updateHitbox();
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	if (voiceNumShit != 13)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
}