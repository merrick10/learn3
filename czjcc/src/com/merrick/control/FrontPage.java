package com.merrick.control;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class FrontPage {
	
	private static Logger log = Logger.getLogger(FrontPage.class);
	
	@RequestMapping(path="/")
	public ModelAndView firstpage(){
		log.info("Controll:/");
		
		return new ModelAndView("index");
		
	}

}
