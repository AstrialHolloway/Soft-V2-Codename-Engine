import haxe.xml.Access;

// Var things
var songThing = "spikes";

var curVoiceline;

var dialogueFilePath = "dio/sounds/" + songThing + "/";

var voiceNumShit = -1;

var bgSpriteTraceShit;

var dioList:Array<String> = 
[
	"none",
    "1",
    "2", 
	"3", 
	"4", 
	"5", 
	"6",
	"7", 
	"8", 
	"none",
	"9", 
	"10", 
	"11", 
	"12", 
	"13", 
	"14", 
	"15", 
	"16",
	"17", 
	"shock", 
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
	"31"
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
	if (voiceNumShit == 9)
	{
		bgEdit("knife-flick");
		bgSprite1.scale.set(0.667,0.667);
		bgSprite1.updateHitbox();
		dialogueBox.visible = false;
	}
	if (voiceNumShit == 10)
	{
		bgEdit("picnic");
		bgSprite1.scale.set(1,1);
		bgSprite1.updateHitbox();
		dialogueBox.visible = true;
	}
	
}

function handleVoices()
{
	voiceNumShit++;
	if (curVoiceline != null) curVoiceline.stop();
	if (voiceNumShit != 0 && voiceNumShit != 9)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	
	
	
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
}