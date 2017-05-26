package com.merrick.db;

import java.sql.Types;

import org.hibernate.Hibernate;
import org.hibernate.dialect.MySQL5Dialect;

public class ExMysqlDialect extends MySQL5Dialect {
	
	public ExMysqlDialect() {

		super();
		registerHibernateType(Types.DECIMAL, Hibernate.BIG_DECIMAL.getName());
		registerHibernateType(Types.LONGVARCHAR,Hibernate.TEXT.getName());
	}

}
