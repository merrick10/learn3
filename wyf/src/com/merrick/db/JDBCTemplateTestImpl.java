package com.merrick.db;

import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JDBCTemplateTestImpl {
	
	private JdbcTemplate jdbctemplate;
	
	@Autowired
	public void setDataSource(DataSource dbcp2datasource){
		this.jdbctemplate = new JdbcTemplate(dbcp2datasource);
	}
	
	public int getpubinfocount(){//如此JdbcTemplate省略了Connection，Statement，ResultSet的开启关闭语句
		int n = 0 ;
		
		Integer i = this.jdbctemplate.queryForObject("select count(1) from tonggao;", Integer.class);
		n = i;		
		return n;
		
	}
	
	public List<Map<String,Object>> getpubinfolist(){
		
		return this.jdbctemplate.queryForList("select * from tonggao;");
		
	}
	
	
	
	
	
}
