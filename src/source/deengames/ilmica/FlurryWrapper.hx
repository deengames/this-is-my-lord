package deengames.ilmica;

import ru.zzzzzzerg.linden.Flurry;

class FlurryWrapper {

  public static function startSession(flurryKey:String) : Void
  {
    Flurry.onStartSession(flurryKey);
  }

  public static function endSession() : Void
  {
    Flurry.onEndSession();
  }

  public static function logEvent(name:String, ?params:Dynamic = null) : Void
  {
    Flurry.logEvent(name, params);
  }

}
