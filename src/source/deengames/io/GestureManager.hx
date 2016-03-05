package deengames.io;

import flixel.util.FlxPoint;
import flixel.FlxG;

class GestureManager
{
  private var gestureStart:FlxPoint;

  // TODO: support more than one callback per gesture
  // TODO: take a sprite or pressed-on object instead of the direction only
  private var callbacks:Map<Gesture, SwipeDirection->Void> = new Map<Gesture, SwipeDirection->Void>();

  public function new() { } 

  public function onGesture(gesture:Gesture, callback:SwipeDirection->Void)
  {
    callbacks.set(gesture, callback);
  }

  // Call this every tick
  public function update() : Void {
    if (FlxG.mouse.pressed && gestureStart == null) {
      // TODO: use world position
      this.gestureStart = FlxG.mouse.getScreenPosition();
    } else if (!FlxG.mouse.pressed && gestureStart != null) {
      var gesture:Gesture = Gesture.Swipe; // TODO: detect, implement more
      var gestureStop:FlxPoint = FlxG.mouse.getScreenPosition();
      var vector:FlxPoint = new FlxPoint(gestureStop.x - gestureStart.x, gestureStop.y - gestureStart.y);

      if ((vector.x * vector.x) + (vector.y + vector.y) <= 25) {
        // Too small to tell what the user wants; movement of 4x4 pixels or so
        return;
      } else {

        var swipeDirection:SwipeDirection;
        if (Math.abs(vector.x) >= Math.abs(vector.y)) {
            swipeDirection = vector.x > 0 ? SwipeDirection.Right : SwipeDirection.Left;
        } else {
          swipeDirection = vector.y > 0 ? SwipeDirection.Down : SwipeDirection.Up;
        }

        if (this.callbacks.exists(Gesture.Swipe)) {
          var callback:SwipeDirection->Void = this.callbacks.get(Gesture.Swipe);
          callback(swipeDirection);
        }

        gestureStart = null;
      }
    }
  }
}

enum Gesture {
  Swipe;
}

enum SwipeDirection {
  Left;
  Right;
  Up;
  Down;
}
