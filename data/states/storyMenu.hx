import funkin.savedata.FunkinSave;

static var storyMenuWeekIndex = 0;

static var storyMenuDiffIndex = 1;

FunkinSave.load();

var selectingDiff = false;

var transitioning = false;

var bgSprite:FunkinSprite = new FunkinSprite(341.5,0);
bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/alleyway"));
bgSprite.scale.set(0.667, 0.667);
bgSprite.updateHitbox();
add(bgSprite);

var sprayPaintCoverSprite:FunkinSprite = new FunkinSprite(0,0);
sprayPaintCoverSprite.loadGraphic(Paths.image("menus/story/backdrop"));
sprayPaintCoverSprite.scale.set(0.667, 0.667);
sprayPaintCoverSprite.color = 0x4ecc81;
sprayPaintCoverSprite.updateHitbox();
add(sprayPaintCoverSprite);

var scoreSprite:FunkinSprite = new FunkinSprite(783.5,0);
scoreSprite.loadGraphic(Paths.image("menus/story/score"));
scoreSprite.scale.set(0.667, 0.667);
scoreSprite.updateHitbox();
add(scoreSprite);

var easelSprite:FunkinSprite = new FunkinSprite(95,0);
easelSprite.loadGraphic(Paths.image("menus/story/easel"));
easelSprite.scale.set(0.667, 0.667);
easelSprite.updateHitbox();
add(easelSprite);

var paletteSprite:FunkinSprite = new FunkinSprite(596,589.5);
paletteSprite.loadGraphic(Paths.image("menus/story/palette"));
paletteSprite.scale.set(0.667, 0.667);
paletteSprite.color = 0x808080;
paletteSprite.updateHitbox();
add(paletteSprite);

var songlistSprite:FunkinSprite = new FunkinSprite(19,539);
songlistSprite.loadGraphic(Paths.image("menus/story/songlist/missing"));
songlistSprite.scale.set(0.667, 0.667);
songlistSprite.updateHitbox();
add(songlistSprite);

var portraitsSprite:FunkinSprite = new FunkinSprite(22,64);
portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/missing"));
portraitsSprite.scale.set(0.667, 0.667);
portraitsSprite.updateHitbox();
add(portraitsSprite);

var titlesSprite:FunkinSprite = new FunkinSprite(8,455);
titlesSprite.loadGraphic(Paths.image("menus/story/titles/missing"));
titlesSprite.scale.set(0.667, 0.667);
titlesSprite.updateHitbox();
add(titlesSprite);

var weekList:Array<WeekData> =
[
    "prelude",
    "week1",
    "week2",
    "week3",
    "week4",
    "week5",
    "week6",
    "epilogue"
];

var diffList:Array<String> = 
[
    "easy",
    "normal", 
    "hard"
];

function update()
{
    handleInputs();
    bgStuffHandler();
}

function bgStuffHandler()
{
    if (storyMenuWeekIndex<=7)
    {
        bgSprite.scale.set(0.667, 0.667);
        if (storyMenuWeekIndex==0)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/tutorial"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/tutorial"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/tutorial"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/alleyway"));
            bgSprite.x=341.5;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==1)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/week1"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/week1"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/week1"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/alleyway"));
            bgSprite.x=341.5;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==2)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/week2"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/week2"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/week2"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/spooky-room"));
            bgSprite.x=446;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==3)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/week3"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/week3"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/week3"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/station"));
            bgSprite.x=446;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==4)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/week4"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/week4"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/week4"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/limo"));
            bgSprite.x=341.5;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==5)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/week5"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/week5"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/week5"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/snowy-town"));
            bgSprite.x=341.5;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==6)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/week6"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/week6"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/week6"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/picnic"));
            bgSprite.x=341.5;
            bgSprite.y=0;
        }
        if (storyMenuWeekIndex==7)
        {
            titlesSprite.loadGraphic(Paths.image("menus/story/titles/stars-aligned"));
            portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/stars-aligned"));
            songlistSprite.loadGraphic(Paths.image("menus/story/songlist/stars-aligned"));
            bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/bench"));
            bgSprite.x=341.5;
            bgSprite.y=0;
        }
    }
    else
    {
        titlesSprite.loadGraphic(Paths.image("menus/story/titles/missing"));
        portraitsSprite.loadGraphic(Paths.image("menus/story/portraits/missing"));
        songlistSprite.loadGraphic(Paths.image("menus/story/songlist/missing"));
        bgSprite.loadGraphic(Paths.image("menus/story/backgrounds/missing"));
        bgSprite.x=400;
        bgSprite.y=100;
        bgSprite.scale.set(1, 1);
    }
}

function handleInputs()
{
    if (controls.LEFT_P)
    {
        if (selectingDiff == false)
        {
            storyMenuWeekIndex--;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
            if (storyMenuWeekIndex < 0)
            {
                storyMenuWeekIndex = 7;
            }
        }
        
    }
    if (controls.RIGHT_P)
    {
        if (selectingDiff == false)
        {
            storyMenuWeekIndex++;
            FlxG.sound.play(Paths.sound("menu/scroll"), 0.7);
            if (storyMenuWeekIndex > 7)
            {
                storyMenuWeekIndex = 0;
            }
        }
    }
    if (controls.ACCEPT)
    {
        if (selectingDiff == true)
        {
            if (transitioning==false)
            {
                transitioning=true;
                FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
                new FlxTimer().start(2.2, function(tmr:FlxTimer)
                {
                    PlayState.loadWeek(weekList[storyMenuWeekIndex],"hard");
                    FlxG.switchState(new PlayState());
                    transitioning=false; 
                });
            }
        }
        else
        {
            FlxG.sound.play(Paths.sound("menu/confirm"), 0.7);
            selectingDiff = true;
            paletteSprite.color = 0xffffff;
            
            
            FlxTween.tween(paletteSprite, { y: 528.5 }, 0.1, { ease: FlxEase.quadOut });

        }
    }
    if (controls.BACK)
    {
        if (selectingDiff == false)
        {
            if (transitioning==false)
            {   
                transitioning=true;
                FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
                new FlxTimer().start(0.3, function(tmr:FlxTimer)
                {
                    FlxG.switchState(new MainMenuState());
                });
            }
        }
        else
        {
            FlxG.sound.play(Paths.sound("menu/cancel"), 0.7);
            selectingDiff = false;
            paletteSprite.color = 0x808080;
            
            FlxTween.tween(paletteSprite, { y: 589.5 }, 0.1, { ease: FlxEase.quadOut });
        }
    }
}