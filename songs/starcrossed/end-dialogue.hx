

// outside of all functions
var curVoiceline;

var dialogueFilePath = "dio/sounds/starcrossed/";

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
	"noneend",
	"shock",
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
		bgEdit("alleyway");
		
		
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	if (voiceNumShit != 7)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
}