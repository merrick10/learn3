package com.merrick.control;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.tiles.TilesContainer;
import org.apache.tiles.access.TilesAccess;
import org.apache.tiles.request.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.tiles3.TilesView;

@Controller
@RequestMapping("/")
public class FrontPage {
	
	private static Logger log = Logger.getLogger(FrontPage.class);
	
	@RequestMapping(path="/")
	public String firstpage(HttpServletRequest rq){
		log.info("Controll:/");
		
		//return new ModelAndView("index");
		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("homepage");
		
	
		
		return "homepage";
		
	}

}
