package com.merrick.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.server.PathParam;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.support.RequestContext;

import com.merrick.util.SpringUtil;

@Controller
@RequestMapping("/examquest")
public class ExamQuestsLibController {
	private static Logger log =  Logger.getLogger(ExamQuestsLibController.class.getName());
	
	@RequestMapping(path="/san/{gradelabel}")
	public String SingleQuestList(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){
		
		log.info(req.getRequestURI());
		
		RequestContext rc = new RequestContext(req);//国际化资源引用对象
			
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.junior"));//国际化
			mdl.addAttribute("gradelevel", grade);
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.senior"));
			mdl.addAttribute("gradelevel", grade);
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}
		log.info("I18N applicationContext test: "+SpringUtil.getApplicationContext().getMessage("grade.junior", null, null));
		
		
		return "questslib/san_list.page2";
	}
	
	@RequestMapping(path="/doc/{gradelabel}",method={RequestMethod.POST,RequestMethod.GET})
	public String DocFileQuestList(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){
		/**文档列表*/
		log.info(req.getRequestURI());
		RequestContext rc = new RequestContext(req);
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.junior"));
			mdl.addAttribute("gradelevel", grade);
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.senior"));
			mdl.addAttribute("gradelevel", grade);
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}
		
		return "questslib/doc_list.page2";
	}
	
	@RequestMapping(path="/edunote/{gradelabel}")
	public String EducationNotesList(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){
		/**笔记*/
		log.info(req.getRequestURI());
		RequestContext rc = new RequestContext(req);
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.junior"));
			mdl.addAttribute("gradelevel", grade);
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.senior"));
			mdl.addAttribute("gradelevel", grade);
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}
		
		return "questslib/edunote_list.page2";
	}
	
	@RequestMapping(path="/newupload/{gradelabel}")
	public String newDocUpload(@PathVariable(value="gradelabel") String grade, HttpServletRequest req, Model mdl){	
		/**上传编辑*/
		RequestContext rc = new RequestContext(req);
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.junior"));
			mdl.addAttribute("gradelevel", grade);
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.senior"));
			mdl.addAttribute("gradelevel", grade);
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}		
		
		return "questslib/doc_upedit.page2";
	}
	
	@RequestMapping(path="/upfile",method={RequestMethod.POST})
	public String saveUploadFiles(@RequestParam(value="gradelevel") String grade, 
			HttpServletRequest req, Model mdl, HttpServletResponse resp	,
			@RequestParam("file1") MultipartFile[] files
	
			){
		/**题文档上传*/
		log.info(req.getRequestURI());
		req.setAttribute("turnpath", "/examquest/doc/"+grade);//提示页面之后跳转地址		

		req.setAttribute("info", "No upload file!");//提示信息		
		try {
			String[] difficulty = req.getParameterValues("difficulty");//作为注解RequestParam会导致提交失败
			String[] stage = req.getParameterValues("stage");
			String[] author = req.getParameterValues("author");
			String[] createtime = req.getParameterValues("createtime");
			String[] foruser = req.getParameterValues("foruser");
			String[] remark = req.getParameterValues("remark");
			boolean opflag = false;
			int cnt = 0;
			for (int i = 0; i < files.length; i++) {
				String fname = files[i].getOriginalFilename();				
				if(!files[i].isEmpty()){					
					String newfilepath = "d:/ex/uploadtest1/" + UUID.randomUUID().toString() + "_" + fname;
					OutputStream os = new FileOutputStream(newfilepath);
					InputStream in =  files[i].getInputStream();
					FileCopyUtils.copy(in, os);
					os.close();
					in.close();
					opflag = true;
					cnt++;
					log.info("filename: " + fname);		
					log.info("difficulty: "+ difficulty[i]);
					log.info("stage: "+ stage[i]);
					log.info("author: "+ author[i]);
					log.info("createtime: "+ createtime[i]);
					log.info("foruser: "+ foruser[i]);
					log.info("remark: "+ remark[i]);
				}				
			}			
			if(opflag){
				req.setAttribute("info", cnt+" file upload successfully! \n Total: "+ files.length);//提示信息
			}
			//apache的api中的ServletFileUpload在spring4中无法解析request获取上传文件FileItem,
			//spring3的MultipartHttpServletRequest的getFileMap()方法获取的条目map为空,
			/**在此MultipartHttpServletRequest的getFile()方法可以获取MultipartFile*/
/*			CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(req.getSession().getServletContext());
			if(multipartResolver.isMultipart(req)){
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)req;
				Iterator<String> iter = multiRequest.getFileNames();
				while(iter.hasNext()){			
					MultipartFile file = multiRequest.getFile(iter.next());
					if(file != null){
						String myFileName = file.getOriginalFilename();
						if(myFileName.trim() !=""){
							log.info(myFileName);
							String newfilepath = "d:/ex/uploadtest1/" + UUID.randomUUID().toString() + "_" + myFileName;
							File newlocalfile = new File(newfilepath);
							file.transferTo(newlocalfile);		
							req.setAttribute("info", "Upload successfully!");//提示信息
						}						
					}					
				}	//多文件上传可行，OK			
			}*/
			
					
			
			
		} catch (Exception e) {
			log.error(e.toString());
			req.setAttribute("info", "Upload failed!");//提示信息
		}
		
		//return "redirect:/examquest/doc/"+grade;
		return "global/commoninfo.page2";		
	}
	
	@RequestMapping(path="/onlineview/{docname:^(?!_)(?!.*?_$)[a-zA-Z0-9\\._\u4e00-\u9fa5]+$}",method={RequestMethod.GET})
	public String filedetail(@PathVariable(value="docname") String docname, @RequestParam(value="gradelevel") String grade,
			HttpServletRequest req, Model mdl, HttpServletResponse resp){

		/**文件在线浏览，适用于文本、图片或html文档，但office尚不适用*/
		RequestContext rc = new RequestContext(req);
		if("j".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.junior"));
			mdl.addAttribute("gradelevel", grade);
		}else if("s".equals(grade)){
			mdl.addAttribute("gradeinfo", rc.getMessage("grade.senior"));
			mdl.addAttribute("gradelevel", grade);
		}else{
			mdl.addAttribute("errinfo1",  "路径错误，所访问页面不存在!");
			return "error/error.page2";
		}		

	
		

		String prjfolder = req.getServletContext().getRealPath("");
		log.info("[project folder]: " + prjfolder);
		File tmpdir = new File(prjfolder + "/" + "tmpdoc" );
		if( !tmpdir.exists() || (tmpdir.exists()&&tmpdir.isFile())){
			boolean md = tmpdir.mkdir();
			if (md) log.info("[create folder success]: "+ prjfolder + "/" + "tmpdoc");
		}
		String docshowname = docname;			
		String docpath = "D:/ex/"+ docshowname;
			
		mdl.addAttribute("docfilename", docshowname);
		InputStream in = null;
		OutputStream out = null;
		String newname = "";
		try {
			in = new FileInputStream(docpath);
			newname = UUID.randomUUID().toString()+"_"+docshowname;
			out = new FileOutputStream(prjfolder + "/" + "tmpdoc/"+newname);
			FileCopyUtils.copy(in, out);
			mdl.addAttribute("docfilepath", "tmpdoc/"+newname);
		} catch ( IOException e) {
			log.info(e.toString());
		} finally{
			if(out!=null){
				try {
					out.close();
				} catch (IOException e) {
					log.info(e.toString());
				}			
			}
			if(in!=null){
				try {
					in.close();
				} catch (IOException e) {
					log.info(e.toString());
				}	
			}
		}		
		
		return "questslib/doc_detail.page2";
	}

}
