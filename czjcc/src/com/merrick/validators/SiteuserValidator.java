package com.merrick.validators;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.merrick.entity.Siteuser;

@Component
public class SiteuserValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		
		return Siteuser.class.equals(arg0);
	}

	@Override
	public void validate(Object obj, Errors errs) {

		Siteuser usr = (Siteuser)obj;
		
		if( null == usr.getId() || "".equals(usr.getId()) ){
			errs.rejectValue("id", "user.id.notnull");
		}
		if( null == usr.getName() || "".equals(usr.getName()) ){
			errs.rejectValue("name", "user.name.notnull");
		}

	}

}
