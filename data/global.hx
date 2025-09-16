




static var redirectStates:Map<Dynamic, String> = [
    WarningState => "warning",
    MainMenuState => "mainMenu",
    StoryMenuState => "storyMenu",
    FreeplayState => "freeplay"
];



function preStateSwitch()
{   
    for(redirectState in redirectStates.keys())
    {
        if(Std.isOfType(FlxG.game._requestedState, redirectState))
        {
            FlxG.game._requestedState = new ModState(redirectStates.get(redirectState));
        }
    }
}
