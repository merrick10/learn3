package com.merrick.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.merrick.entity.Siteuser;
import com.merrick.entity.Tonggao;

/**
 * @author liumiao
 * 
 * 手动验证，继承接口验证()
 *
 */
@Component
public class TonggaoValidator implements Validator {
	

	@Override
	public boolean supports(Class<?> arg0) {
		return Tonggao.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors errs) {
		
		Tonggao t = (Tonggao) obj;
		if(null== t.getTitle() || "".equals(t.getTitle())){
			//此方法可以加四个参数,第一个表单域field,区分是哪个表单出错 ; 第二个errorCode错误码;第三个资源文件中占位符,第四个具体错误返回信息
            //简写版可以把2,3参数去掉
			errs.rejectValue("title", "info.title.null");//直接引用资源id，而不要加大括号
			//errs.rejectValue("title", null, null, "info.title.null");
		}
		
		if(null==t.getContent()||"".equals(t.getContent())){
			errs.rejectValue("content", "info.content.null");
		}
		
		if(t.getTitle().length()>90){
			errs.rejectValue("title", "info.title.toolong");
		}
		if(t.getContent().length()>10000000){//16777216
			errs.rejectValue("content", "info.content.toolong");
		}
		

	}

}
