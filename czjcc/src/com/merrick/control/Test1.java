package com.merrick.control;

import java.util.Date;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/test1")
public class Test1 extends ParentControl{
	
	private static Logger log = Logger.getLogger(Test1.class);
	
	
	@RequestMapping(path="/f1",method={RequestMethod.GET})
	public String f1(Model mdl){
		
		String str1 = new Date().toString();
		mdl.addAttribute("str_datetime", str1);
		log.info("½øÈëtest1/f1");
		
		return "test/test1";
	}
	

}
