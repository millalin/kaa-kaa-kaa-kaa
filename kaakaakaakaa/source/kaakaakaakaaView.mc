import Toybox.Graphics;
import Toybox.Lang;
import Toybox.System;
import Toybox.WatchUi;

using Toybox.Time;
using Toybox.Time.Gregorian;

class kaakaakaakaaView extends WatchUi.WatchFace {

    function initialize() {
        WatchFace.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.WatchFace(dc));
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Get and show the current time
        var clockTime = System.getClockTime();
        var hour = clockTime.hour.format("%02d");
        var min = clockTime.min.format("%02d");

        var hour1 = hour.substring(0, 1);
        var hour2 = hour.substring(1, 2);
        var min1 = min.substring(0, 1);
        var min2 = min.substring(1, 2);

        var hourstring1 = check(hour1);
        var hourstring2 = check(hour2);

        var minstring1 = check(min1);
        var minstring2 = check(min2);

        var timeString =  hourstring1 + " " +  hourstring2 +"\n" + minstring1 + " " + minstring2;
        var view = View.findDrawableById("TimeLabel") as Text;
        view.setText(timeString);

        var today = Gregorian.info(Time.now(), Time.FORMAT_SHORT);
        var dateString = Lang.format(
            "$1$.$2$.$3$",
            [
                today.day,
                today.month,
                today.year
            ]
        );

        if (dateString != null) {
            var viewdate = View.findDrawableById("date") as Text;
            viewdate.setText(dateString);
        }

        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

    }

    function check(timenum) {
        if (timenum.equals("0")) {
            return "noo";
        }
        if (timenum.equals("1")) {
            return "yy";
        }
        if (timenum.equals("2")) {
            return "kaa";
        }
        if (timenum.equals("3")) {
            return "koo";
        }
        if (timenum.equals("4")) {
            return "nee";
        }
        if (timenum.equals("5")) {
            return "vii";
        }
        if (timenum.equals("6")) {
            return "kuu";
        }
        if (timenum.equals("7")) {
            return "see";
        }
        if (timenum.equals("8")) {
            return "kasi";
        }
        if (timenum.equals("9")) {
            return "ysi";
        }
        return "";
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

    // The user has just looked at their watch. Timers and animations may be started here.
    function onExitSleep() as Void {
    }

    // Terminate any active timers and prepare for slow updates.
    function onEnterSleep() as Void {
    }

}
