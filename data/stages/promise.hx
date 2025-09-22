moveTrain = false;
moveTrain2 = false;

function create()
{
	gaytext.visible=false;
	gaytext.playAnim('idle');
	thugtext.visible=false;
	thugtext.playAnim('idle');
}
	
function update(elapsed:Float)
{
	
}

function beatHit(curBeat:Int)
{
	if (curBeat == 204)
	{
		thugtext.visible=true;
		thugtext.playAnim('thugtext');
	}
	if (curBeat == 209)
	{
		thugtext.visible=false;
	}
	if (curBeat == 236)
	{
		gaytext.visible=true;
		gaytext.playAnim('gaytext');
	}
	if (curBeat == 240)
	{
		gaytext.visible=false;
	}
}

