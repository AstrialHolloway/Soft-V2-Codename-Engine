var animationBG:FunkinSprite = new FunkinSprite(0, 0);
animationBG.loadGraphic(Paths.image("stages/rolling girl/background"));
animationBG.color = 0x000000;
animationBG.scale.set(2,2);
animationBG.updateHitbox();
animationBG.visible = false;
add(animationBG);

var animationSprite:FunkinSprite = new FunkinSprite(950, 350); // Declare a variable to store the text object
animationSprite.scale.set(1,1);
animationSprite.frames = Paths.getSparrowAtlas("characters/benjamin");
animationSprite.animation.addByPrefix("start", "BF dies", 24, false);
animationSprite.animation.addByPrefix("idle", "BF Dead Loop", 24, true);
animationSprite.animation.addByPrefix("end", "BF Dead confirm", 24, false);
animationSprite.updateHitbox();
animationSprite.visible = false;
add(animationSprite);


function onEvent(animation) {
  if (animation.event.name == "spikesDeath") {
    
    var params:Array = animation.event.params;
    
    if (params[0] == "start")
    {
      animationSprite.visible = true;
      animationBG.visible = true;
      animationSprite.animation.play("start");
      camHUD.visible=false;
    }
    if (params[0] == "idle")
    {
      animationSprite.y = 359;
      animationSprite.visible = true;
      animationBG.visible = true;
      animationSprite.animation.play("idle");
    }
    if (params[0] == "end")
    {
      animationSprite.y = 314;
      animationSprite.visible = true;
      animationBG.visible = true;
      animationSprite.animation.play("end");
    }

  }
}