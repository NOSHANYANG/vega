package util;

import java.util.concurrent.TimeUnit;

public class DateUtil {

    public static String formateDuration(long millis){
        return String.format("%d分%d秒%d毫秒",
                TimeUnit.MILLISECONDS.toMinutes(millis),
                TimeUnit.MILLISECONDS.toSeconds(millis) % 60,
                millis % 1000);
    }
}
