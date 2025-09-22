import haxe.xml.Access;

// Var things
var songThing = "begrudge";

var curVoiceline;

var dialogueFilePath = "dio/sounds/" + songThing + "/";

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
	"14", 
	"15", 
	"16", 
	"17", 
	"none", 
	"19", 
	"20", 
	"21", 
	"22", 
	"23", 
	"none", 
	"25", 
	"26", 
	"27", 
	"28", 
	"none", 
	"30", 
	"31", 
	"32", 
	"33", 
	"none", 
	"35",
	"37", 
	"38", 
	"39", 
	"40", 
	"41", 
	"42", 
	"43", 
	"44", 
	"45"
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
		bgEdit("picnic");
		
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	if (voiceNumShit != 17 && voiceNumShit != 23 && voiceNumShit != 28 && voiceNumShit != 33)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
}