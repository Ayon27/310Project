package com.DateCalc;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

public class dateCalculator {
    public static long diffInDays(String d1, String d2) throws ParseException {
        String pattern = "yyyy-MM-dd";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        Date date1 = simpleDateFormat.parse(d1);
        Date date2 = simpleDateFormat.parse(d2);

        long diff = date2.getTime() - date1.getTime();
        System.out.println(TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS));
        return TimeUnit.DAYS.convert(diff, TimeUnit.MILLISECONDS);
    }
}
