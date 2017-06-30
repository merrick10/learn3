package com.merrick.db;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.merrick.entity.Tonggao;

@Repository
public class DAOJdbcTemplate {
	private static Logger log =  Logger.getLogger(DAOJdbcTemplate.class.getName());
	
	private JdbcTemplate jdbctemplate;
	
	@Autowired
	public void setDataSource(DataSource dbcp2datasource){
		this.jdbctemplate = new JdbcTemplate(dbcp2datasource);
	} 
	
	public boolean saveOneTonggao(Tonggao obj){//信息发布，保存，insert
		
		int returnvalue = this.jdbctemplate.update("insert into tonggao(type2,title,pubday,content,ispub,optime,puber)values(?,?,?,?,?,?,?)",
				"1",obj.getTitle(),new Date(),obj.getContent(),"1",new Date(),"admin");
		log.info("save result: "+returnvalue);
		
		boolean rst = (returnvalue>0)?true:false;
		
		return rst;
	}
	
	public List getInfoList(String pubday, String title){
		StringBuffer sql = new StringBuffer();
		List lst = null;

		sql.append("select t.title as title, t.pubday as pubday, u.name as name from tonggao t left join siteuser u on t.puber=u.id where 1=1 ");
		if(null != pubday && !"".equals(pubday)){
			sql.append("and t.pubday='"+ pubday +"' ");

		}
		if(null != title && !"".equals(title)){
			sql.append("and t.title like '%"+ title +"%' ");

		}
		sql.append("order by t.optime desc ");
		
		
		lst = this.jdbctemplate.query(sql.toString(),new RowMapper<Map<String,String>>(){

			@Override
			public Map<String,String> mapRow(ResultSet rs, int index) throws SQLException {
				
				Map<String,String> mp = new HashMap<String,String>();
				mp.put("title", rs.getString("title"));
				mp.put("pubday", rs.getDate("pubday").toString());
				mp.put("name", rs.getString("name"));					
				return mp;
			}
			
		});
		
		return lst;
		
		
		
	}

}
