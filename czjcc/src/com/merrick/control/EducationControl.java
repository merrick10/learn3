package com.merrick.control;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merrick.db.DBCP2TestImpl;

@Controller
@RequestMapping("/education")
public class EducationControl {
	
	private static Logger log =  Logger.getLogger(EducationControl.class.getName());
	
	@Autowired
	private DBCP2TestImpl dbcp2;
	
	
	@RequestMapping(path="/new",method={RequestMethod.GET})
	public String newoperation(HttpServletRequest req){
		
		log.info("new update");
		
		int ucnt = dbcp2.getSiteUserCount();
		req.setAttribute("usercount", ucnt);
		
		
		
		
		return "educate/edu_first.page2";
	}

}
