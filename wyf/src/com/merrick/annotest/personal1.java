/**
 * 
 */
package com.merrick.annotest;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @author liumiao
 *
 */
@Target(value = { ElementType.METHOD })
@Retention(value = RetentionPolicy.RUNTIME)
public @interface personal1 {
	
	public int id();
	
	public String p1() default "ABC";

}
