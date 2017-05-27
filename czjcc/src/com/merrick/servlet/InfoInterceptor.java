package com.merrick.servlet;

import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.context.request.WebRequestInterceptor;

import com.merrick.control.InfoControl;

public class InfoInterceptor implements WebRequestInterceptor {
	
	private static Logger log =  Logger.getLogger(InfoInterceptor.class.getName());

	@Override
	public void afterCompletion(WebRequest arg0, Exception arg1) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(WebRequest arg0, ModelMap arg1) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void preHandle(WebRequest arg0) throws Exception {
			
		//arg0.setAttribute(name, value, scope);
		//WebRequest.SCOPE_REQUEST
		//WebRequest.SCOPE_SESSION
		//WebRequest.SCOPE_GLOBAL_SESSION
	}

}
