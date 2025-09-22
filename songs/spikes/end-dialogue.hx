import haxe.xml.Access;

// Var things
var songThing = "spikes";

var curVoiceline;

var dialogueFilePath = "dio/sounds/" + songThing + "/";

var voiceNumShit = -1;

var bgSpriteTraceShit;

var dioList:Array<String> = 
[
	"noneend",
	"noneend",
	"noneend",
    "1end",
    "2end", 
	"3end", 
	"4end", 
	"5end", 
	"6end",
	"noneend",
	"7end",
	"8end",
	"9end", 
	"10end", 
	"noneend",
	"11end", 
	"noneend",
	"13end", 
	"noneend",
	"15end", 
	"16end",
	"17end",
	"18end",
	"19end",
	"20end",
	"21end",
	"22end",
	"23end",
	"24end",
	"25end",
	"26end",
	"27end",
	"28end",
	"29end",
	"30end",
	"31end",
	"32end",
	"33end",
	"34end",
	"noneend",
	"35end",
	"36end",
	"37end",
	"38end",
	"42end",
	"39end",
	"40end",
	"41end",
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
	if (voiceNumShit == 39)
	{
		bgEdit("walkoff");
		bgSprite1.scale.set(0.667,0.667);
		bgSprite1.updateHitbox();
		dialogueBox.visible = false;
	}
	if (voiceNumShit == 40)
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
	if (voiceNumShit != 0 && voiceNumShit != 1 && voiceNumShit != 2 && voiceNumShit != 9 && voiceNumShit != 14 && voiceNumShit != 16 && voiceNumShit != 18 && voiceNumShit != 39)
	{
		curVoiceline = FlxG.sound.play(Paths.sound(dialogueFilePath+dioList[voiceNumShit]));
	}
	
	
	
}

function destroy()
{
	if (curVoiceline != null && !curVoiceline.persist) curVoiceline.destroy();
}