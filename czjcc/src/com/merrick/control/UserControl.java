package com.merrick.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.apache.tiles.TilesContainer;
import org.apache.tiles.access.TilesAccess;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.merrick.db.BaseHibernateImpl;
import com.merrick.db.SiteUserDAOImpl;
import com.merrick.entity.Siteuser;

@Controller
@RequestMapping("/user")
public class UserControl {
	
	private static Logger log = Logger.getLogger(UserControl.class);	
	
	@Autowired
	private SiteUserDAOImpl db;
	
	@Autowired
	private BaseHibernateImpl bhi;
	
	@RequestMapping(path="/edit",method={RequestMethod.GET})
	public String edit(Model mdl,HttpServletRequest request, HttpServletResponse response){		


		
		log.info("user/edit");		//
		return "user/user_edit";
	}
	
	@RequestMapping(path="/saveuser",method={RequestMethod.POST})
	public String saveuser(Siteuser user){		
		
		log.info("ID: "+user.getId());//
		log.info("NAME: "+user.getName());
		log.info("INTRO: "+user.getIntro());		
		
//		if(errs.hasErrors()){
//			return "/user/user_edit";
//		}

		user.setCipher("21218cca77804d2ba1922c33e0151105");
		
		bhi.saveOrUpdate(user);
				
		return "redirect:/user/listall";
	//	return "user/user_list";
		//return listall(mdl);//有异常
	}
	
	
	@RequestMapping(path="/list",method={RequestMethod.GET})
	public String list(Model mdl){		

		log.info("user/list");		//
		mdl.addAttribute("user", db.getOneUserFromID("admin"));
		
		return "user/user_list";
	}
	
	@RequestMapping(path="/listall",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listall(Model mdl){
		

		log.info("user/list");		//
//		mdl.addAttribute("user", db.getAllUser());//OK		
//		mdl.addAttribute("user", bhi.getListBySQL("select * from siteuser"));//OK
		mdl.addAttribute("user", bhi.getObjectList("select * from siteuser", Siteuser.class));//OK//当然,结果必须是已声明映射的对象,查询所有列
		
//		return "user/user_list";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userpage");	
		
		return mav;
		
	}
	
	

}
