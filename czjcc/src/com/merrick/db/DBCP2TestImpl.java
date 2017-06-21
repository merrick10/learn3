package com.merrick.db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


@Repository
public class DBCP2TestImpl {
	
	private static Logger log =  Logger.getLogger(DBCP2TestImpl.class.getName());
	
	@Autowired
	private BasicDataSource dbcp2datasource;
	
	public int getSiteUserCount(){
		int n = 0;
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			con = dbcp2datasource.getConnection();
			st = con.createStatement();
			rs = st.executeQuery("select count(1) from siteuser;");
			if(rs.last()){
				n = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			log.error(e.toString());
		} finally{
			if(rs!=null){
				try {
					rs.close();
				} catch (SQLException e) {
					log.error(e.toString());
				}
			}
			if(st!=null){
				try {
					st.close();
				} catch (SQLException e) {
					log.error(e.toString());
				}
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					log.error(e.toString());
				}
			}
			
		}
		
		
		return n;
	}

}
