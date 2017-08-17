package com.merrick.util;

import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Component;


@Component
public class SpringUtil implements ApplicationContextAware {
	
	private static ApplicationContext applicationContext;//实现ApplicationContextAware接口并声明为spring的bean后自动注入对象
	
	public static ApplicationContext getApplicationContext(){		
		return applicationContext;
	}
	
	

	@Override
	public void setApplicationContext(ApplicationContext arg0) throws BeansException {
		applicationContext = arg0;
		
	}
	
	
	public static Object getBean(String id){
		Object obj = null;
		obj = applicationContext.getBean(id);
		return obj;
	}

}
