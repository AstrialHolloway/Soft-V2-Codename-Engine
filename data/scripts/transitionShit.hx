function postCreate(event) {
    transitionTween.cancel(); // Disabling original tween

    // Rotating Sprites
    transitionSprite.angle = event.transOut ? -90 : 90;
    transitionSprite.setGraphicSize(transitionCamera.height, transitionCamera.width); transitionSprite.updateHitbox(); // Once with switched angle, proportions need to go along
    transitionSprite.screenCenter();
    blackSpr.setPosition(event.transOut ? -transitionCamera.width : transitionCamera.width, 0); // Doing X instead of Y tween
    
    // Updating camera direction to change X instead of Y       
    transitionCamera.flipY = false;
    transitionCamera.flipX = !event.transOut;
    transitionCamera.scroll.set(transitionCamera.width);

    transitionTween = FlxTween.tween(transitionCamera.scroll, {x: -transitionCamera.width}, 2/3, {ease: FlxEase.sineOut, onComplete: (_) -> finish()});
}