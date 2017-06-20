package com.merrick.control;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(path="/examquest")
public class ExamQuestsLibController {
	private static Logger log =  Logger.getLogger(ExamQuestsLibController.class.getName());
	
	@RequestMapping(path="/san/{gradelabel}")
	public String SingleQuestList(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){
		
		log.info(req.getRequestURI());
		
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", "初中");
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", "高中");
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}
		
		
		return "questslib/san_list.page2";
	}
	
	@RequestMapping(path="/doc/{gradelabel}")
	public String DocFileQuestList(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){
		
		log.info(req.getRequestURI());
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", "初中");
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", "高中");
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}
		
		return "questslib/doc_list.page2";
	}
	
	@RequestMapping(path="/edunote/{gradelabel}")
	public String EducationNotesList(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){
		
		log.info(req.getRequestURI());
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", "初中");
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", "高中");
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}
		
		return "questslib/edunote_list.page2";
	}
	
	
	
	

}
