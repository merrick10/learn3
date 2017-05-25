package com.merrick.control;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class FrontPage {
	
	private static Logger log = Logger.getLogger(FrontPage.class);
	
	@RequestMapping(path="/")
	public String firstpage(Model mdl,HttpServletRequest rq){
		log.info("Controll:/");
		
		//return new ModelAndView("index");
		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("homepage");
		
		
		
		return "base";
		
	}

}
