package com.merrick.control;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.merrick.db.DAOJdbcTemplate;
import com.merrick.db.JDBCTemplateTestImpl;
import com.merrick.db.TonggaoImpl;
import com.merrick.entity.Tonggao;
import com.merrick.util.MyAuth;
import com.merrick.validators.TonggaoValidator;

import net.sf.json.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


/**
 * @author liumiao
 *
 */
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
	
	@Autowired
	private DAOJdbcTemplate commonimpl;
	
	@RequestMapping(path="/list",method={RequestMethod.GET,RequestMethod.POST})
	public String listpage(Model mdl){
		
		int n = jtpi.getpubinfocount();
		
		mdl.addAttribute("totalcnt", n);
		
		return "info/info_list.page";		
	} 
	
	/**
	 * ajax查询信息列表
	 * * 在使用@RequestMapping后，返回值通常解析为跳转路径，
	 * 加上@ResponseBody后返回结果不会被解析为跳转路径，而是直接写入HTTP response body中
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
//	@MyAuth(level=0)
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
//	@MyAuth(level=0)
	@RequestMapping(path="/submit",method={RequestMethod.POST})
	public String saveoneinfo(Model mdl,  @ModelAttribute("commoninfo") Tonggao info, Errors errs){
		
		tv.validate(info, errs);
		if(errs.hasErrors()){
			return "info/info_edit.page";
		}
		
		Tonggao obj = new Tonggao();
		obj.setContent(info.getContent());
		obj.setTitle(info.getTitle());
		
		
		commonimpl.saveOneTonggao(obj);
			
		return "redirect:/info/list";		
	} 
	
	
	/**
	 * //kindeditor上传图片保存
	 * @param request
	 * @param response
	 */
	@RequestMapping(path="/uploadpic",method={RequestMethod.POST})
	public void uploadpicforkindeditor(HttpServletRequest request, HttpServletResponse response){
			
		String ffolder = "e:/testupload2/";
		String filename = "";//原始文件名
		String newname = "";//不含后缀
		String newfpath = "";//完整文件路径
		String filesuffix = "";//不含点号
		InputStream is = null;
		OutputStream os = null;
		try {
			
			MultipartHttpServletRequest mRequest = (MultipartHttpServletRequest) request;
			Map<String, MultipartFile> fileMap = mRequest.getFileMap();
			for (Iterator<Map.Entry<String, MultipartFile>> iterator = fileMap.entrySet().iterator(); iterator.hasNext();) {
				Map.Entry<String, MultipartFile> entry = (Map.Entry<String, MultipartFile>) iterator.next();
				MultipartFile mfile = entry.getValue();
				filename = mfile.getOriginalFilename();
				log.info("kindeditor upload file name: "+ filename);
				is = mfile.getInputStream();
				filesuffix = filename.substring(filename.lastIndexOf(".")+1);//不含点号
				newname = UUID.randomUUID().toString() ;
				newfpath = ffolder+newname+"."+filesuffix;
				os = new FileOutputStream(newfpath);
				FileCopyUtils.copy(is, os);				
				break;//单文件上传
			}
						
			String servicepath =request.getScheme() + "://" + request.getServerName()+":"+ request.getServerPort() +  request.getContextPath() + "/";
			log.info("servercontextpath: "+servicepath);
			String furl = servicepath+"info/viewpic/"+ filesuffix +"/"+newname;
			log.info("File URL: "+furl);
		
			response.getOutputStream().write(msgforkdeditor(0,furl,"").getBytes("utf-8"));//SUCCESS
			
		} catch (IOException e) {
			log.error(e.toString());
			try {
				response.getOutputStream().write(msgforkdeditor(1,"","upload fail,"+e.toString()).getBytes("utf-8"));//fail
			}  catch (Exception e2) {
				log.error(e2.toString());
			}
		}	finally{
			
			try {
				if(os!=null)
					os.close();
			} catch (IOException e1) {
				log.error(e1.toString());
			}
			try {
				if(is!=null)
					is.close();
			} catch (IOException e) {
				log.error(e.toString());
			}
		}
	}
	
	
	/**
	 * //kindeditor需要的返回消息，0：成功，1：错误
	 * @param iserror
	 * @param picurl
	 * @param msg
	 * @return
	 */
	public  String msgforkdeditor(int iserror, String picurl, String msg ){
		JSONObject obj = new JSONObject();
		obj.put("error", iserror);
		obj.put("url",picurl);
		obj.put("message", msg);			
		return obj.toString();
	}
	
	
	/**
	 * //浏览图片
	 * @param picsuffix
	 * @param fname
	 * @param request
	 * @param response
	 */
	@RequestMapping(path="/viewpic/{filesuffix}/{picrealfilename}",method={RequestMethod.POST,RequestMethod.GET})
	public void viewpic( @PathVariable(value="filesuffix") String picsuffix, @PathVariable(value="picrealfilename") String fname, 
			HttpServletRequest request, HttpServletResponse response){
		
		InputStream is = null;
		OutputStream os = null;
		try {
			log.info("file: " + fname);
			log.info("suffix: " + picsuffix);
			String ffolder = "e:/testupload2/";
			String filename = fname+"."+picsuffix;

			
			if(  picsuffix.toLowerCase().endsWith("jpg") || picsuffix.toLowerCase().endsWith("jpeg") ){
				response.setContentType("image/jpeg;charset=UTF-8");
			}else if(picsuffix.toLowerCase().endsWith("ico")){
				response.setContentType("image/x-icon;charset=UTF-8");
			}else if(picsuffix.toLowerCase().endsWith("png")){
				response.setContentType("image/png;charset=UTF-8");
			}else if(picsuffix.toLowerCase().endsWith("gif")){
				response.setContentType("image/gif;charset=UTF-8");
			}
			is = new FileInputStream(ffolder+filename);
			os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			
			
		} catch (FileNotFoundException e) {
			log.error(e.toString());
		} catch (IOException e) {
			log.error(e.toString());
		} finally{
			try {
				if(os!=null)
					os.close();
			} catch (IOException e1) {
				log.error(e1.toString());
			}
			try {
				if(is!=null)
					is.close();
			} catch (IOException e) {
				log.error(e.toString());
			}
		}		
	}
	
	@ResponseBody
	@RequestMapping(path="/querybyparam",method={RequestMethod.POST})
	public void getlistbyparam(@RequestParam(name="pubday") String pubday, @RequestParam(name="title")  String title, 
			HttpServletRequest request, HttpServletResponse response){		
		
		try {
			
	//		log.info("pubday: "+ pubday + ", title: "+ title);
			
			List lst = commonimpl.getInfoList(pubday,title);
			
	//		log.info(lst);			
			
			JSONArray jsn = JSONArray.fromObject(lst);
			
			response.getWriter().print(jsn);			
			return;
			
		} catch (IOException e) {
			log.info(e.toString());
		}		
		
	}
	
	

}
