package com.merrick.servlet;

import java.io.File;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.apache.catalina.core.ApplicationContext;
import org.apache.log4j.Logger;
import org.apache.log4j.xml.DOMConfigurator;

/**
 * Application Lifecycle Listener implementation class Log4jListener
 *
 */
@WebListener
public class Log4jListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public Log4jListener() {
 
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 

    	String path = arg0.getServletContext().getRealPath("/")+ "WEB-INF/classes/log4jex.xml";
    	
    	File f = new File(path);
    	System.out.println("------Log4J Start------");
        System.out.println("log4j conf: "+path);
        
        if(f!=null){
        	DOMConfigurator.configure(path);
        }
        
        Logger log = Logger.getLogger(Log4jListener.class);
        log.info("==== Now log4j is working ====");
    	    	
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
       
    }
	
}
