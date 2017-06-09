package com.merrick.control;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/education")
public class EducationControl {
	
	private static Logger log =  Logger.getLogger(EducationControl.class.getName());
	
	
	@RequestMapping(path="/new",method={RequestMethod.GET})
	public String newoperation(){
		
		log.info("new update");
		return "test/test1.page_w";
	}

}
