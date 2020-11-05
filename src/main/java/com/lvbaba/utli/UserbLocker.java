package com.lvbaba.utli;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.TYPE;

/**
 * Created by YY on 2020/11/5.
 */
@Retention(RetentionPolicy.RUNTIME)
/**
 * TYPE 注解可以加在类上面
 * METHOD 注解可以加载方法上面]
 * 拦截器
 */
@Target({TYPE,METHOD})
public @interface UserbLocker {
}
