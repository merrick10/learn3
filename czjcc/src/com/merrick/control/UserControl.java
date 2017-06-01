package com.merrick.control;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
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
	public String editonesiteuser(Model mdl,HttpServletRequest request, HttpServletResponse response){		
		
		log.info("user/edit");		//
		return "user/user_edit.page";
	}
	
	@RequestMapping(path="/saveuser",method={RequestMethod.POST})
	public String saveonesiteuser(Siteuser user){		
		
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
	public String list_admin(Model mdl){		

		log.info("user/list");		//
		mdl.addAttribute("user", db.getOneUserFromID("admin"));
		
		return "user/user_list";
	}
	
	@RequestMapping(path="/listall",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView listallsiteusers(Model mdl){
		

		log.info("user/list");		//
//		mdl.addAttribute("user", db.getAllUser());//OK		
//		mdl.addAttribute("user", bhi.getListBySQL("select * from siteuser"));//OK
		mdl.addAttribute("user", bhi.getObjectList("select * from siteuser", Siteuser.class));//OK//当然,结果必须是已声明映射的对象,查询所有列
		
//		return "user/user_list";
		ModelAndView mav = new ModelAndView();
		mav.setViewName("userpage");	
		
		return mav;		
	}
	
	@RequestMapping(path="/signout",method={RequestMethod.GET})
	public String siteusersignout(HttpServletRequest req){
		
		log.info("user logout");
		
		req.getSession().removeAttribute("user");
		return "redirect:/";
	}
	
	@RequestMapping(path="/signinpage",method={RequestMethod.GET})
	public String signininput(HttpServletRequest req){
		
		log.info("for user login");
		
		
	
		return "user/user_login.page";
	}
	
	@RequestMapping(path="/signinverify",method={RequestMethod.POST})
	public String siteusersignin(HttpServletRequest req){
		
		log.info("varify user login");
		
		String id = req.getParameter("uid");
		String psw = req.getParameter("upsw");
		String rcode = req.getParameter("rancode");
		
		log.info("RanCode_user_submit: [" +  rcode + "]");
		String codeinsession = (String) req.getSession().getAttribute("vrcode");
		log.info("RanCode_system: [" +  codeinsession + "]");
		
		if(id == null || psw == null){
			//用户名/密码空
			log.info("用户名/密码空");
			return "redirect:signinpage";
		}
		
		if(codeinsession!=null && rcode != null && rcode.equals(codeinsession)){
			
			Object obj = bhi.findOneBySql(Siteuser.class, "select * from siteuser where id='"+id+"'");
							
			if(obj!=null){
				Siteuser u = (Siteuser) obj;
				String correctencpsw = u.getCipher();
				String psw_user_submit_enc = org.apache.commons.codec.digest.DigestUtils.md5Hex(psw);
				
				if(correctencpsw.equals(psw_user_submit_enc)){
					req.getSession(true).setAttribute("user", u);
					//验证通过
					log.info("验证通过");
					return "redirect:/";
				}else{
					//密码错误
					log.info("密码错误");
					return "redirect:signinpage";
				}				
			}else{
				//不存在此ID
				log.info("不存在此ID");
				return "redirect:signinpage";
			}						
			
		}else{
			//验证码错误
			log.info("验证码错误");
			return "redirect:signinpage";
		}
			
	}

	
	@RequestMapping(path="/rcode",method={RequestMethod.GET})
	public void getuservcode(HttpServletRequest req, HttpServletResponse resp){
		
		log.info("varify user login");
		OutputStream os = null;
		
		try {
			os = resp.getOutputStream();
			resp.setContentType("image/jpeg;charset=UTF-8");			
			
			BufferedImage bi = new BufferedImage(100,30, BufferedImage.TYPE_INT_RGB);
			Graphics2D g = bi.createGraphics(); 
			
			//g.setBackground(Color.getHSBColor( 0.5f,0.2f, 0.7f));
//			g.setBackground(Color.lightGray);
			g.setColor(Color.yellow);
			g.fillRect(0, 0, 100, 30);			
			
			g.setColor(Color.black);
	//		g.drawLine(0, 0, 100, 10);			
			
			g.drawLine(0, 0, 100, 30);
			
			char[] ch = new char[5];
			
			for (int i = 0; i < ch.length; i++) {
				
				Random r = new Random();
				int n1 = r.nextInt(10);
				
				int n2  = r.nextInt(26);
				
				int corn = r.nextInt(2);
				
				int c = 0;
				if(corn == 0){
					c = (int)'A'  + n2 ;
					ch[i] = (char) c;
				}else{
					c = (int)'0'  + n1 ;
					ch[i] = (char) c;
				}
									
			}
			g.setFont(new Font(null, Font.ITALIC, 16));
			g.drawString(new String(ch), 18, 20); 		
			
			g.dispose();
			bi.flush();
						
			log.info("Code: "+ new String(ch));
			//g.drawString(str, x, y);
			
			ImageIO.write(bi, "JPEG", os);
			os.flush();
			
			req.getSession(false).setAttribute("vrcode", new String(ch));			
			
		} catch (IOException e) {
			log.warn(e.toString());
		} finally{
			try {
				if (os!=null)
					os.close();
			} catch (IOException e) {
				log.warn(e.toString());
			}
		}		
		
	}	

}
