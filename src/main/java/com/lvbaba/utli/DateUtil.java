package com.lvbaba.utli;

import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * @author DBY
 * @date 2020/11/6 17:57
 */
public class DateUtil {
    private static SimpleDateFormat sdf;

    public static boolean compareDate(String date1,String date2) throws ParseException {
        sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.parse(date1).getTime() > sdf.parse(date2).getTime();
    }
}
