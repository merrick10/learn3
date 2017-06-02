/**
 * 
 */
package com.merrick.validators;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.merrick.entity.Siteuser;

/**
 * @author liumiao
 *
 */
public class SiteuserValidator implements Validator {

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#supports(java.lang.Class)
	 */
	@Override
	public boolean supports(Class<?> arg0) {
		
		return Siteuser.class.equals(arg0);
	}

	/* (non-Javadoc)
	 * @see org.springframework.validation.Validator#validate(java.lang.Object, org.springframework.validation.Errors)
	 */
	@Override
	public void validate(Object obj, Errors errs) {
		Siteuser u = (Siteuser) obj;
		if(null==u.getId() || "".equals(u.getId())){
			//此方法可以加四个参数,第一个表单域field,区分是哪个表单出错 ; 第二个errorCode错误码;第三个资源文件中占位符,第四个具体错误返回信息
            //简写版可以把2,3参数去掉
			errs.rejectValue("uid", null, null, "User ID is NULL.");
		}
		
		if(null==u.getCipher()||"".equals(u.getCipher())){
			errs.rejectValue("upsw", "PASSWORD  is NULL.");
		}
			
		
	}

}
