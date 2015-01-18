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
import deengames.io.AudioManager;
import deengames.ilmica.Scene;
import deengames.thisismylord.scene.CreditsScreen;

class TitleScreen extends Scene
{
  /**
  * Function that is called up when to state is created to set it up.
  */
  override public function create():Void
  {
    var title:FlxSprite = this.addAndCenter('assets/images/titlescreen.png');
    this.loadAndPlay('assets/audio/speech/title');
    this.hideAudioButton();

    var creditsButton = this.addAndCenter('assets/images/credits.png');
    creditsButton.x = 64;
    creditsButton.y = FlxG.height - creditsButton.height - 96;
    MouseEventManager.add(creditsButton, null, clickedCreditsButton);

    super.create();
  }

  private function clickedCreditsButton(sprite:FlxSprite) : Void {
    FlxG.switchState(new CreditsScreen());
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
