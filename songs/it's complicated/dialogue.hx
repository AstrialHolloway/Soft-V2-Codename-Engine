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
	
}

function postNext(event)
{
	trace(curLine.char + " says: " + curLine.text);
	
	if (curLine.char == "bf")
	{
		bgEdit("station");
		bgSprite1.scale.set(1,1);
		bgSprite1.updateHitbox();
		trace("sprite made: Station");
		
	}
	
}