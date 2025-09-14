function next(event)
{
	if (!event.playFirst) trace("-");
}

var bgSprite1:FunkinSprite = new FunkinSprite(0,0);

insert(members.indexOf = 1, bgSprite1);
add(bgSprite1);

function bgEdit(sprite)
{	
	
	bgSprite1.loadGraphic(Paths.image("dialogue/backgrounds/"+sprite));
	if (sprite == "no-cigar_GRIMACEBLAST")
	{
		bgSprite1.scale.set(0.67,0.67);
		bgSprite1.x = -319;
		bgSprite1.y = -180;
	}
	else
	{
		bgSprite1.scale.set(1,1);
		bgSprite1.x = 0;
		bgSprite1.y = 0;
	}
	
}

function postNext(event)
{
	trace(curLine.char + " says: " + curLine.text);
	if (curLine.char == "pico")
	{
		bgEdit("alleyway");
		trace("sprite made");
	}
	if (curLine.char == "father")
	{
		bgEdit("alleyway");
		trace("sprite made");
	}
	if (curLine.char == "")
	{
		bgEdit("no-cigar_GRIMACEBLAST");
		dialogueBox.visible = false;
		trace("sprite made");
	}
	else
	{
		dialogueBox.visible = true;
	}

}