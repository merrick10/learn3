package com.merrick.control;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;
import javax.websocket.server.PathParam;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/err")
public class ErrorInfo extends ParentControl{
	
	private static Logger log = Logger.getLogger(ErrorInfo.class);
	
	@RequestMapping(value="/{errnum}" ,method=RequestMethod.GET)
	public String errorpage(@PathVariable int errnum, Model mdl,HttpServletRequest req){
		
		log.info(errnum);
		
		mdl.addAttribute("errinfo1",  errnum);
		mdl.addAttribute("errinfo2",  req.getAttribute("info"));
		
		//return "error/error";
		return "error/error.page";
	}
	
	@RequestMapping(value="/uncaughtException" ,method=RequestMethod.GET)
	public String errorpage(Model mdl,Exception e){
		log.info("uncaughtException");
		mdl.addAttribute("errinfo1",  e.toString());//看似不能完全捕获
		
		//return "error/error";		
		return "error/error.page";
	}
	
	
}
