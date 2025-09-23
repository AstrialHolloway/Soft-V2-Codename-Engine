import haxe.xml.Access;

// Var things
var songThing = "spotlight";

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
	"18",
	"none"
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

function update()
{
	bgSprite1.setGraphicSize(FlxG.width, FlxG.height);
	bgSprite1.updateHitbox();
}

function postNext(event)
{
	handleVoices();
	trace(curLine.char + " says: " + curLine.text);
	if (voiceNumShit == 0)
	{
		bgEdit("limo");
		
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	if (voiceNumShit != 9 || voiceNumShit != 14)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
	startVideo(cut);
}