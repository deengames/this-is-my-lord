package deengames.thisismylord;

import flixel.FlxG;
import flixel.FlxState;
import deengames.ilmica.Scene;
import deengames.thisismylord.scene.*;

class SetupOrder extends FlxState
{
  override public function create():Void
  {
    var scenes:Array<Class<Scene>> = [
      TitleScreen,
      DarknessScene,
      SawStarScene,
      PointingAtStarScene,
      DislikeStarScene,
      LookingAtMoonScene,
      MoonSetsScene,
      SunriseScene,
      FreeOfYouScene,
      CreatorOfUniverseScene,
      CreatedMeScene,
      GuidesMeScene,
      FeedsMeScene,
      CuresMeScene,
      ToDieScene,
      ForgivenessScene,
      DedicateScene,
      TheEndScreen
    ];

    Scene.scenes = scenes;
    FlxG.switchState(new deengames.ilmica.SplashScreen());

    super.create();
  }

  /**
  * Function that is called when this state is destroyed - you might want to
  * consider setting all objects this state uses to null to help garbage collection.
  */
  override public function destroy():Void
  {
    super.destroy();
  }

  /**
  * Function that is called once every frame.
  */
  override public function update():Void
  {
    super.update();
  }
}
