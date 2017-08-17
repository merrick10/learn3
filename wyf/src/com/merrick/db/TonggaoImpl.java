package com.merrick.db;

import java.util.LinkedHashMap;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.type.Type;
import org.springframework.beans.factory.annotation.Autowired;



public class TonggaoImpl {
	
	private static Logger log =  Logger.getLogger(TonggaoImpl.class.getName());
	
	@Autowired
	private BaseHibernateImpl bhi;

	
	public List getTonggaoList(){
		
		List lst = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append("select t.title as title, t.pubday as pubday, u.name as pubername from tonggao t left join siteuser u ");
		sql.append("on t.puber = u.id ");
		sql.append("order by t.optime desc ");
		
		LinkedHashMap<String, Type> map = new LinkedHashMap<String, Type>();		
		
		map.put("title", Hibernate.STRING);
		map.put("pubday", Hibernate.STRING);
		map.put("pubername", Hibernate.STRING);
				
		lst = bhi.getListMapBySql(sql.toString(), map);
		
		log.info(sql.toString());
		
		return lst;
	}

}
