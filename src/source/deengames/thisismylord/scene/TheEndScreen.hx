package deengames.thisismylord.scene;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.Lib;
import flixel.FlxGame;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;
import flixel.plugin.MouseEventManager;

import deengames.io.GestureManager;
import deengames.ilmica.Scene;
import deengames.ilmica.FlurryWrapper;

class TheEndScreen extends Scene
{
  /**
  * Function that is called up when to state is created to set it up.
  */
  override public function create():Void
  {
    var title:FlxSprite = this.addAndCenter('assets/images/the-end.png');

    var restart:FlxSprite = this.addAndCenter('assets/images/restart.png');
    restart.y = FlxG.height - restart.height - 32;
    MouseEventManager.add(restart, null, restartGame, null, null);

    this.loadAndPlay('assets/audio/speech/the-end');
    this.hideAudioButton();

    var sawLastScene = Date.now().getTime();
    if (Reg.sawFirstScene > 0) {
      // Millisecond granularity on Android
      var elapsedSeconds = sawLastScene - Reg.sawFirstScene;
      elapsedSeconds = Math.round(elapsedSeconds / 1000.0);
      FlurryWrapper.logEvent('Completed Content', { 'Seconds' : elapsedSeconds });
      Reg.sawFirstScene = 0;
    }

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

  private function restartGame(sprite:FlxSprite) : Void
  {
    FlxG.switchState(new DarknessScene());
  }
}
