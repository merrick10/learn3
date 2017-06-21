package com.merrick.control;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.merrick.db.JDBCTemplateTestImpl;
import com.merrick.db.TonggaoImpl;
import com.merrick.entity.Tonggao;
import com.merrick.util.MyAuth;
import com.merrick.validators.TonggaoValidator;

import net.sf.json.JSON;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/info")
public class InfoControl {
	
	private static Logger log =  Logger.getLogger(InfoControl.class.getName());
	
	@Autowired
	private TonggaoValidator tv;
	
	@Autowired
	private TonggaoImpl ti ;
	
	@Autowired
	private JDBCTemplateTestImpl jtpi;
	
	@RequestMapping(path="/list",method={RequestMethod.GET})
	public String listpage(Model mdl){
		
		int n = jtpi.getpubinfocount();
		
		mdl.addAttribute("totalcnt", n);
		
		return "info/info_list.page";		
	} 
	
	/**
	 * ajax查询信息列表
	 * @param datestr
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(path="/getlistjson",method={RequestMethod.POST})
	public void getdata_json(@RequestParam(name="optime") String datestr, HttpServletResponse response){
		try {
			log.info("getlistjson,date param: " + datestr);
			
			List infolst = ti.getTonggaoList();
			
			HashMap<String,Object> mp = new HashMap<String,Object>();
			mp.put("listdata", infolst);
			JSON res = JSONObject.fromObject(mp);
			String jsstr = res.toString();
			//HttpServletResponse resp = ((ServletRequestAttributes)RequestContextHolder.getRequestAttributes()).getResponse();
		
			response.getWriter().print(jsstr);
		} catch (IOException e) {
			log.error(e.toString());
		}		
	} 
	
	/**
	 * 进入编辑页
	 * @param mdl
	 * @return
	 */
	@MyAuth(level=0)
	@RequestMapping(path="/edit",method={RequestMethod.GET})
	public String editdetailinfo(Model mdl){
		
		mdl.addAttribute("commoninfo", new Tonggao());
		
		return "info/info_edit.page";		
	} 
	
	/**
	 * 保存
	 * @param mdl
	 * @param info
	 * @param errs
	 * @return
	 */
	@MyAuth(level=0)
	@RequestMapping(path="/submit",method={RequestMethod.POST})
	public String saveoneinfo(Model mdl, @ModelAttribute("commoninfo") Tonggao info, Errors errs){
		
		tv.validate(info, errs);
		if(errs.hasErrors()){
			return "info/info_edit.page";
		}
		
		
		return "redirect:/info/list";		
	} 
	
	

}
