package com.merrick.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.merrick.control.InfoControl;

public class BasicInterceptor implements HandlerInterceptor {
	
	private static Logger log =  Logger.getLogger(BasicInterceptor.class.getName());

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		//Controller之后,返回视图之前

	}

	@Override
	public boolean preHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2) throws Exception {
		
		
		
		log.info(arg0.getRequestURL());
		//return false;终止请求
		
		
		return true;
	}

}
