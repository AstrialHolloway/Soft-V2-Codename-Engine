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

function bgCreateSpookyRoomDark()
{	
	
	
	bgSprite1.loadGraphic(Paths.image("dialogue/backgrounds/spooky-room-dark"));

	
}

function bgCreateSpookyRoom()
{	
	
	
	bgSprite1.loadGraphic(Paths.image("dialogue/backgrounds/spooky-room"));

	
}

function postNext(event)
{
	trace(curLine.char + " says: " + curLine.text);
	if (curLine.char == "megablade")
	{
		bgEdit("spooky-house");
		trace("sprite made");
	}
	if (curLine.text == "I don’t know about this place, Pico...")
	{
		bgEdit("spooky-room-dark");
		trace("sprite made");
	}
	if (curLine.text == "")
	{
		bgEdit("spooky-room");
		trace("sprite made");
	}
}