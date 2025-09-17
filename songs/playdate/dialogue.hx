import haxe.xml.Access;

// Var things
var songThing = "playdate";

var curVoiceline;

var dialogueFilePath = "dio/sounds/" + songThing + "/";

var voiceNumShit = -1;

var bgSpriteTraceShit;

// holy fuck that's a lot of dialogue

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
	"none", 
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
	"none",
	"19",
	"20"
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
		bgEdit("daytime-house");
		
	}
	if (voiceNumShit == 5)
	{
		bgEdit("station");
		
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	
	if (curVoiceLind != 10 && curVoiceLind != 14 && curVoiceLind != 20)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	
	
}
