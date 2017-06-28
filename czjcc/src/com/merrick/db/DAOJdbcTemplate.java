package com.merrick.db;

import java.util.Date;

import javax.sql.DataSource;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
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
	
	public boolean saveOneTonggao(Tonggao obj){
		
		int returnvalue = this.jdbctemplate.update("insert into tonggao(type2,title,pubday,content,ispub,optime,puber)values(?,?,?,?,?,?,?)",
				"1",obj.getTitle(),new Date(),obj.getContent(),"1",new Date(),"admin");
		log.info("save result: "+returnvalue);
		return true;
	}

}
