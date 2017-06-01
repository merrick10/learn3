/**
 * 
 */
package com.merrick.servlet;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.http.HttpStatus;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.merrick.entity.Siteuser;
import com.merrick.util.MyAuth;

/**
 * @author liumiao
 *
 */
public class MyAuthInterceptor extends HandlerInterceptorAdapter {
	private static Logger log = Logger.getLogger(MyAuthInterceptor.class);	
	

	

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean flag = true;
		
		if(handler.getClass().isAssignableFrom(HandlerMethod.class)){
			
			MyAuth auth = ( (HandlerMethod)handler).getMethodAnnotation(MyAuth.class);//.getMethod().getAnnotation(MyAuth.class);
			if(auth!=null){//需要登录
				
				if(request.getSession().getAttribute("user") == null){//未登录
					log.warn("未登录无权限访问"+request.getRequestURI());

					String msg = "请先登录！";
					request.setAttribute("info", msg);					

					request.getRequestDispatcher("/err/403").forward(request, response);
					
					//response.setStatus(HttpStatus.FORBIDDEN.value());
//					response.setContentType("text/html; charset=UTF-8");
//					
//					PrintWriter pw = response.getWriter();
//					pw.write(msg);
//					pw.flush();
//					pw.close();
					flag = false;

					
				}else{//已登录
					
					Siteuser u = (Siteuser)request.getSession().getAttribute("user") ;
					
					if( auth.level() == 0 && u.getLevel() != 0
						|| auth.level() == 2 && u.getLevel() == 1	
							){//需要管理员
						log.warn("非管理员无权限访问"+request.getRequestURI());
						
						String msg = "没有访问权限！";
						request.setAttribute("info", msg);
		
						request.getRequestDispatcher("/err/403").forward(request, response);
						
						//response.setStatus(HttpStatus.FORBIDDEN.value());
//						response.setContentType("text/html; charset=UTF-8");
//						
//						PrintWriter pw = response.getWriter();
//						pw.write(msg);
//						pw.flush();
//						pw.close();
						
						flag = false;
					}
					
				}				
			}
			
		}
				
		return flag;
	}
	
	
	

}
