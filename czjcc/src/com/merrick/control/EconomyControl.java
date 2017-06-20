package com.merrick.control;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(path="/finance")
public class EconomyControl {
	
	private static Logger log = Logger.getLogger(EconomyControl.class);	
	
	
	@RequestMapping(path="/firstpage",method={RequestMethod.GET,RequestMethod.POST})
	public String firstlist(){
		
		log.info("finance list");
		return "economy/firstlist.page";
	}

}
