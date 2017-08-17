package com.merrick.db;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.CriteriaSpecification;
import org.hibernate.type.Type;

import com.merrick.entity.BaseEntity;

public class BaseHibernateImpl {
	private static Logger logger = Logger.getLogger(BaseHibernateImpl.class.getName());
	private Session session = null;
	private Transaction transaction = null;

	private SessionFactory sessionFactory;		

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//插入
	public int insert(Object object) {
		
		int returnvalue;
			
		try {			
		//	session = this.sessionFactory.getCurrentSession();
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();	
			session.persist(object);
			transaction.commit();
			returnvalue =1;			
			
		} catch (HibernateException e) {
			logger.warn(e.getMessage());
			returnvalue = 0;
		} finally {
			//session.close();
		}		

		return returnvalue;
	}

	//删除
	public int delete(Object object) {
		
		int returnvalue ;
			
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();	
			session.delete(object);
			transaction.commit();
			returnvalue = 1;
			
		} catch (HibernateException e) {
			logger.warn(e.getMessage());
			returnvalue = 0;
		}finally{
			//session.close();
		}	

		return returnvalue;
	}

	//修改
	public int update(Object object) {
		
		int returnvalue;
	
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();	
			session.update(object);
			transaction.commit();
			returnvalue = 1;
		} catch (HibernateException e) {
			logger.warn(e.getMessage());
			returnvalue = 0;
		}finally {
			//session.close();
		}

		return returnvalue;
	}

	//查询
	/**
	 * @param sql 查询SQL语句
	 * @param alias 查询结果字段别名字符串数组
	 * @return listmap
	 */
	public List getListBySql(String sql,String[] alias) {
		
		List ls = null;
	
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();	
			SQLQuery qr = session.createSQLQuery(sql);
			for (int i = 0; i < alias.length; i++) {
				qr.addScalar(alias[i], Hibernate.STRING);				
			}
			
			qr.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
			ls = qr.list();
		} catch (HibernateException e) {
			logger.warn(e.getMessage());
		} finally{
			transaction.commit();
			//session.close();			
		}
		return ls;
	}
	
	public List getListBySQL( String sql){
		
		List ls = null;
		try{
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();			
			SQLQuery qr = session.createSQLQuery(sql);
			ls = qr.list();			
			transaction.commit();
		}catch(Exception e){
			logger.warn(e.getMessage());
		}finally{
		//	//session.close();		//此种方式获取session不需要手动关闭,由spring生成	
		}
				
		return ls;
		
	}
	
	public List getListMapBySql(String sql, LinkedHashMap<String, Type> map) {
		List ls = null;
		session = this.sessionFactory.getCurrentSession();
		Transaction tran = session.beginTransaction();
		try {
			
			SQLQuery query = session.createSQLQuery(sql);
			Iterator<?> it = map.entrySet().iterator();
			while (it.hasNext()) {
				Map.Entry entry = (Map.Entry)it.next();
				String key = (String) entry.getKey();
				Type type = (Type)entry.getValue();
				query.addScalar(key, type);
			}
			query.setResultTransformer(CriteriaSpecification.ALIAS_TO_ENTITY_MAP);
			ls = query.list();
		} catch (HibernateException e) {
			e.printStackTrace();
			logger.warn(e.getMessage());
		} finally {
			tran.commit();
			//session.close();
		}
		return ls;
	}
	
	/**
	 * 根据SQL语句查找指定的实体对象
	 * 
	 * @param cs
	 *            类类型
	 * @param sql
	 *            SQL语句
	 * @return 实体对象
	 */
	public BaseEntity findOneBySql(Class<?> cs, String sql) {
		List<BaseEntity> list;
		BaseEntity baseEntity = null;
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();	
			Query query = session.createSQLQuery(sql).addEntity(cs);
			list = (List) query.list();
			if (list.size() > 0) {
				baseEntity = list.get(0);
			}
			transaction.commit();
			return baseEntity;
		} catch (HibernateException e) {
			e.printStackTrace();
			logger.warn(e.getMessage());
			return null;
		} finally {
			//session.close();
		}
	}
	

	
	//根据sql语句修改数据库
	public int saveBySql(String sql) {
		int result = 0;
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			Query query = session.createSQLQuery(sql);
			result = query.executeUpdate();
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();			
		} finally {
			//session.close();
		}
		return result;
	}
	
	/**
	 * 根据sql语句执行数据库更新操作
	 * 
	 * @param object
	 * @return int
	 */
	public int saveBySql(String[] sql) {
		int result = 0;
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			for (int i = 0; i < sql.length; i++) {
				Query query = session.createSQLQuery(sql[i]);
				result += query.executeUpdate();
			}
			transaction.commit();
		} catch (HibernateException e) {
			transaction.rollback();
			e.printStackTrace();
			logger.warn(e.getMessage());
		} finally {
			//session.close();
		}
		return result;
	}
	
	/**
	 * 根据SQL语句查询数量
	 * 
	 * @param sql语句
	 * @return int
	 */
	public int getListCount(String sql) {
		List ls = null;
		int result = 0;
		session = this.sessionFactory.getCurrentSession();
		Transaction tran = session.beginTransaction();
		try {
			Query query = session.createSQLQuery(sql);
			ls = query.list();
			result = Integer.parseInt(ls.get(0).toString());
		} catch (HibernateException e) {
			e.printStackTrace();
			logger.warn(e.getMessage());
		} finally {
			tran.commit();
			//session.close();
		}
		return result;
	}
	
	
	/**
	 * 根据SQL语句查询数量(防止SQL注入)
	 * 
	 * @param sql语句
	 * @return int
	 */
	public int getListCount(String sql,String param) {
		List ls = null;
		int result = 0;
		session = this.sessionFactory.getCurrentSession();
		Transaction tran = session.beginTransaction();
		try {
			Query query = session.createSQLQuery(sql);
			query.setString(0, param);
			ls = query.list();
			result = Integer.parseInt(ls.get(0).toString());
		} catch (HibernateException e) {
			e.printStackTrace();
			logger.warn(e.getMessage());
		} finally {
			tran.commit();
			//session.close();
		}
		return result;
	}
	
	/**
	 * 保存或更新对象
	 * 
	 * @param object
	 * @return boolean
	 */
	public int saveOrUpdate(List object) {
		int returnValue;
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			for (int i = 0; i < object.size(); i++) {
				session.saveOrUpdate(object.get(i));
				if (i % 20 == 0) {
					session.flush();
					session.clear();
				}

			}
			transaction.commit();
			returnValue = 1;
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn(e.getMessage());
			transaction.rollback();
			returnValue = 0;
		} finally {
			//session.close();
		}
		return returnValue;
	}
	
	public int saveOrUpdate(Object object) {
		int returnValue;
		try {
			session = this.sessionFactory.getCurrentSession();
			transaction = session.beginTransaction();
			session.saveOrUpdate(object);
			transaction.commit();
			returnValue = 1;
		} catch (Exception e) {
			e.printStackTrace();
			logger.warn(e.getMessage());
			transaction.rollback();
			returnValue = 0;
		} finally {
		//	//session.close();//spring管理
		}
		return returnValue;
	}

	public List<Object> getObjectList(String sql,Class<?> clz){
		List ls = null;
		
		session = this.sessionFactory.getCurrentSession();
		transaction = session.beginTransaction();	
		
		SQLQuery qr = session.createSQLQuery(sql);
		qr.addEntity(clz);
		ls = qr.list();			
		transaction.commit();
		
		return ls;
	}

}
