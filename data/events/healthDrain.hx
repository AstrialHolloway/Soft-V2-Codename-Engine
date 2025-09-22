var drainHealth = false;

function onEvent(drain) {
  if (drain.event.name == "healthDrain") {
    
    var params:Array = drain.event.params;
    
    if (params[0] == true)
    {
      drainHealth = true;
    }
    if (params[0] == false)
    {
      drainHealth = false;
    }

  }
}

function update()
{
  if (drainHealth == true)
  {
    if (health > 0.1)
    {
      health = health - 0.01;
    }
  }
}