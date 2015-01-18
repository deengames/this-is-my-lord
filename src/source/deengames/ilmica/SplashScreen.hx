package deengames.ilmica;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.FlxSprite;
import deengames.ilmica.Scene;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;
import deengames.io.GestureManager;

class SplashScreen extends Scene
{
  var startTime:Float = 0;

  /**
  * Function that is called up when to state is created to set it up.
  */
  override public function create():Void
  {
    this.hideAudioButton();
    var title:FlxSprite = this.addAndCenter('assets/images/dg-logo.png');
    this.loadAndPlay('assets/audio/giggle');

    // Fade in over 0.5s
    FlxG.camera.fade(FlxColor.BLACK, 0.5, true);

    super.create();
    startTime = Date.now().getTime();
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
    // Wait 3s + 0.5s fade-in, then fade out
    if (startTime > 0 && Date.now().getTime() - startTime >= 3500) {
      startTime = 0; // Execute this block only once
      // Fade out over 0.5s
      FlxG.camera.fade(FlxColor.BLACK, 1
        , false,function() {
        FlxG.switchState(Type.createInstance(Scene.scenes[0], []));
      });
    }
    super.update();
  }

  override private function onSwipe(direction:SwipeDirection) : Void
  {
    // Do nothing
  }
}
