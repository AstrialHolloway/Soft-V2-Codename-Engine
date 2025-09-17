import haxe.xml.Access;

// Var things
var songThing = "high-spirits";

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
	"10", 
	"11", 
	"12", 
	"13", 
	"14",
	"15",
	"16",
	"17",
	"none",
	"18",
	"19",
	"20",
	"21",
	"22",
	"23",
	"24",
	"25",
	"26",
	"27",
	"28",
	"29",
	"30",
	"31",
	"32",
	"33",
	"34",
	"35",
	"36",
	"37",
	"38",
	"39"
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
		bgEdit("spooky-house");
		
	}
	if (voiceNumShit == 6)
	{
		bgEdit("spooky-room-dark");
		
	}
	if (voiceNumShit == 18)
	{
		bgEdit("spooky-room");
		
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	
	if (curVoiceLind != 18)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	
	
}
