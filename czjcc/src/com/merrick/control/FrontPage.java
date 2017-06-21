package com.merrick.control;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.merrick.db.JDBCTemplateTestImpl;

@Controller
@RequestMapping("/")
public class FrontPage {
	
	private static Logger log = Logger.getLogger(FrontPage.class);
	
	@Autowired
	private JDBCTemplateTestImpl jtpi;
	
	@RequestMapping(path="/")
	public String firstpage(Model mdl,HttpServletRequest rq){
		log.info("Controll:/");
		
		//return new ModelAndView("index");		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("homepage");
		
		List<Map<String,Object>> lst = jtpi.getpubinfolist();
		
		mdl.addAttribute("lst", lst);
		
		
		
		return "base";
		
	}

}
