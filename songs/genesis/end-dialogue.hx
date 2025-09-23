import haxe.xml.Access;

// Var things
var songThing = "genesis";

var curVoiceline;

var dialogueFilePath = "dio/sounds/" + songThing + "/";

var voiceNumShit = -1;

var bgSpriteTraceShit;

var dioList:Array<String> = 
[
    "none",
    "1end",
    "2end", 
    "none",
  	"3end", 
  	"4end",
    "none",
  	"5end",
  	"6end",
  	"7end", 
  	"8end", 
  	"9end"
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
		bgEdit("snowy-town");
		
	}
  if (voiceNumShit == 2)
	{
		bgEdit("genesis_hug");
		
	}
  if (voiceNumShit == 3)
	{
		bgEdit("snowy-town");
		
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
