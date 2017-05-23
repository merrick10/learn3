package com.merrick.control;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.merrick.entity.Siteuser;

@Controller
@RequestMapping("/user")
public class UserControl {
	
	private static Logger log = Logger.getLogger(UserControl.class);
	

	
	
	@RequestMapping(path="/edit",method={RequestMethod.GET})
	public String edit(Model mdl){
		
	//	String str1 = new Date().toString();
	//	mdl.addAttribute("str_datetime", str1);
		log.info("user/edit");		//
		return "user/user_edit";
	}
	
	@RequestMapping(path="/saveuser",method={RequestMethod.POST})
	public String saveuser(Siteuser user,
			Errors errs){
		
		
		log.info("ID: "+user.getId());//
		log.info("NAME: "+user.getName());
		log.info("INTRO: "+user.getIntro());		
	
		
		if(errs.hasErrors()){
			return "/user/user_edit";
		}		
		
		return "user/user_list";
	}
	

}
