package deengames.ilmica;
//import googleAnalytics.Stats;

class GoogleAnalyticsWrapper {

    private static inline var STATS_URL:String = 'stats.deengames.com';
    private static inline var TRACKING_CODE:String = 'UA-11092514-4';

    /**
     * trackingCode: your Google Analytics code (eg. UA-11092514-4)
     * pageUrl: a pseudo URL to track on new-session, eg. /this-is-my-lord.html
     */
    public static function init(pageUrl:String) : Void
    {
      //Stats.init(TRACKING_CODE, STATS_URL);
      if (pageUrl.indexOf('/') > 0) {
        pageUrl = "/${pageUrl}";
      }
      //Stats.trackPageview(pageUrl);
    }

    private static function getPlatform() : String
    {
      #if flash
        return "flash";
      #elseif neko
        return "neko";
      #elseif android
        return "android";
      #elseif ios
        return "iOS";
      #elseif windows
        return "windows";
      #elseif linux
        return "linux";
      #elseif mac
        return "mac";
      #elseif html5
        return "html5";
      #else
        return "default platform";
      #end
    }

}
