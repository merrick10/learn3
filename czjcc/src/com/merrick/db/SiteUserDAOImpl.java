package com.merrick.db;

import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;

import com.merrick.entity.Siteuser;


public class SiteUserDAOImpl implements SiteUserDAO {
	
	
	private SessionFactory mySessionFactory;
	
	public SessionFactory getSessionFactory() {
		return mySessionFactory;
	}
	
	
	public void setSessionFactory(SessionFactory mySessionFactory) {
		this.mySessionFactory = mySessionFactory;
	}


	
	public Siteuser getOneUserFromID(String ID) {
		
		Session ss = this.mySessionFactory.getCurrentSession();
		
		Transaction trans = ss.beginTransaction();
		
		List lst = ss.createSQLQuery("select * from siteuser where id='"+ ID +"'").addEntity(Siteuser.class).list();
		
		trans.commit();
		//session无需关闭
		Siteuser obj  = null;
		
		if(lst.size()>0){
			obj = (Siteuser) lst.get(0);
		}
			
		return obj;
	}
	
	public List getAllUser() {
		
		Session ss = this.mySessionFactory.getCurrentSession();
		
		Transaction trans = ss.beginTransaction();
		
		SQLQuery qr = ss.createSQLQuery("select * from siteuser ");
		
		qr.addEntity(Siteuser.class);	
		
	    List lst = qr.list() ;		
		
		trans.commit();
					
		return lst;
	}
	

	@Override
	public void saveOneUser(Siteuser u) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteOneUserFromID(String ID) {
		// TODO Auto-generated method stub
		
	}


}
