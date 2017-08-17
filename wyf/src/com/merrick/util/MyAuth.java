/**
 * 
 */
package com.merrick.util;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author liumiao
 * 简单实现方法级的访问权限设定
 *
 */

@Retention(value = RetentionPolicy.RUNTIME)
@Target(value = { ElementType.METHOD })
public @interface MyAuth {
	
	public int level() default 1;
	public String describe() default "";
}
