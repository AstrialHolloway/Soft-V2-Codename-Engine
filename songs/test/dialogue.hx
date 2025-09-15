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
	if (curLine.char == "pico-left")
	{
		bgEdit("spooky-room");
		trace("sprite made: Spooky Room");
	}
	if (curLine.text == "(FLASH)")
	{
		bgEdit("lowtiergod");
		bgSprite1.scale.set(0.5,0.5);
		bgSprite1.updateHitbox();
		trace("sprite made: Low Teir God");
	}
	if (curLine.text == "Beep!")
	{
		bgEdit("spooky-room");
		bgSprite1.scale.set(1,1);
		bgSprite1.updateHitbox();
		trace("sprite made: Spooky Room");
	}
}