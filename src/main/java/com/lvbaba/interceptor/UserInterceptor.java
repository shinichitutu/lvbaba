package com.lvbaba.interceptor;

import com.lvbaba.entity.User;
import com.lvbaba.utli.UserbLocker;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.spi.SyncResolver;
import java.lang.reflect.Method;

/**
 * Created by YY on 2020/11/5.
 * 拦截器
 */
public class UserInterceptor extends HandlerInterceptorAdapter{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (handler instanceof HandlerMethod){
            HandlerMethod handlerMethod= (HandlerMethod) handler;
            Class<?> clazz=handlerMethod.getBeanType();
            Method method=handlerMethod.getMethod();
            if (clazz.isAnnotationPresent(UserbLocker.class)){
                HttpSession session=request.getSession();
                User user= (User) session.getAttribute("user");
                if (user==null){
                    request.setAttribute("error","请先登录");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                    return false;
                }
            }else if(method.isAnnotationPresent(UserbLocker.class)){
                HttpSession session=request.getSession();
                User user= (User) session.getAttribute("user");
                if (user==null){
                    request.setAttribute("error","请先登录");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                    return false;
                }
            }
        }
        return true;
    }
}
