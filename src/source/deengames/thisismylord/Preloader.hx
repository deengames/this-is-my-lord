// Adapted from http://gamepopper.co.uk/2014/08/26/haxeflixel-making-a-custom-preloader/

package deengames.thisismylord;

import flash.Lib;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flixel.system.FlxPreloader;
import openfl.display.Sprite;

@:bitmap("assets/images/preloader-logo.png") class LogoImage extends BitmapData { }

class Preloader extends FlxPreloader
{
	var logo:Sprite = new Sprite();
	private static inline var FADE_FROM_PERCENT = 0.75;

	public function new(minDisplayTime:Float = 2, ?allowedUrls:Array<String>)
	{
		super(minDisplayTime, allowedUrls);
	}

	// this class mimics the look of the levelup bar from playstate but is drawn programmatically.
	// this is to prevent importing anything unnecessary, like PNG files.
	// as a result, everything is hand-coded to use 4x pixels, like the rest of the game.
	override private function create():Void
	{
		this._width = Lib.current.stage.stageWidth;
		this._height = Lib.current.stage.stageHeight;

		var bitmap = new Bitmap(new LogoImage(0,0));
		// Rotate around origin
		bitmap.x = -bitmap.width / 2;
		bitmap.y = -bitmap.height / 2;

		//Sets the graphic of the sprite to a Bitmap object,
		// which uses our embedded BitmapData class.
		logo.addChild(bitmap);
		logo.x = (this._width - logo.width) / 2;
		logo.y = (this._height - logo.height) / 2;

		// account for negative-coordinates origin
		logo.x += -bitmap.x;
		logo.y += -bitmap.y;
		addChild(logo); //Adds the graphic to the preloader's buffer.
	}

	// fill the bar as progress continues. note that it only updates every 4 pixels, mimicking the 4x resolution
	// of the rest of the game.
	override public function update(percent:Float):Void
	{
		// 60 FPS, two rotations per second
		logo.rotation += 12;
		// 0-90% = 1.0 alpha
		// 91-100% = 1.0 => 0
		if (percent >= FADE_FROM_PERCENT) {
			logo.alpha = 1 - (percent - FADE_FROM_PERCENT) * (1 / (1 - FADE_FROM_PERCENT));
		}
	}
}
