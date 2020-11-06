package com.lvbaba.utli;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

/**
 * Created by YY on 2020/11/5.
 * CookieUtil类
 */


public class CookieUtil {
    public static Cookie getCookie(String key,Cookie[] cookies){
        if (cookies==null || cookies.length==0 ||key==null){
            return null;
        }
        for (Cookie c:cookies) {
            if (c.getName().equals(key)){
                return c;
            }
        }
        return null;
    }
}
