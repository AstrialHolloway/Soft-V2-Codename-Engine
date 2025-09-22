

function create()
{
	sakura.visible = false;
}
	
function onEvent(leaves) {
  if (leaves.event.name == "toggleLeaves") {
    
    var params:Array = leaves.event.params;
    
    if (params[0] == true)
    {
      sakura.visible = true;
    }
    if (params[0] == false)
    {
      sakura.visible = false;
    }
  }
}
