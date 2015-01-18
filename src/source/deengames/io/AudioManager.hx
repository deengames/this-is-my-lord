package deengames.io;

import flixel.system.FlxSound;
import flixel.FlxG;

class AudioManager {
  public static inline var SOUND_EXT:String = #if flash ".mp3" #else ".ogg" #end ;

  private function new() { } // static class

  public static function play(name:String) : Void {
    FlxG.sound.load(name + SOUND_EXT).play();
  }
}
