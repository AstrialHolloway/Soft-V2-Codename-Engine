var animationBG:FunkinSprite = new FunkinSprite(0, 0);
animationBG.loadGraphic(Paths.image("stages/rolling girl/background"));
animationBG.color = 0xb2b2b2;
animationBG.updateHitbox();
add(animationBG);


var animationSprite:FunkinSprite = new FunkinSprite(400, 200); // Declare a variable to store the text object
animationSprite.scale.set(1.6,1.6);
animationSprite.frames = Paths.getSparrowAtlas("stages/lagtrain/fullscreen/sven/LagSen");
animationSprite.animation.addByPrefix("1", "LagSen", 24, true);
animationSprite.animation.play("1");
animationSprite.updateHitbox();
add(animationSprite);


function onEvent(animation) {
  if (animation.event.name == "animation2") {
    
    var params:Array = animation.event.params;
    
    
    animationBG.color = 0x+params[1];
    animationSprite.scale.set(params[6],params[6]);
    

    animationSprite.frames = Paths.getSparrowAtlas(params[2]);
    animationSprite.animation.addByPrefix("1", params[3], 24, params[4]);
    animationSprite.animation.play("1");

    animationSprite.updateHitbox();
    animationSprite.x=params[7];
    animationSprite.y=params[8];
    
    if (params[0] == false)
    {
      animationBG.visible = false;
    }
    if (params[0] == true)
    {
      animationBG.visible = true;
    }

    if (params[9] == false)
    {
      animationSprite.visible = false;
    }
    if (params[9] == true)
    {
      animationSprite.visible = true;
    }

    if (params[5] == false)
    {
      animationBG.visible = true;
      animationSprite.visible = true;
    }
    if (params[5] == true)
    {
      animationBG.visible = false;
      animationSprite.visible = false;
    }
  }
}