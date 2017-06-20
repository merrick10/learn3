package com.merrick.db;

import com.merrick.entity.Siteuser;

public interface SiteUserServe {

	public Siteuser getOneUserFromID(String ID);
	
	public void saveOneUser(Siteuser u);
	
	public void deleteOneUserFromID(String ID);
	
}
