package com.merrick.servlet;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class TestSerlet2
 */
@WebServlet(loadOnStartup=2,  urlPatterns = "/TestSerlet2" )
public class TestSerlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TestSerlet2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		System.out.println("TestSerlet2 init");
		//Ωˆ◊¢Ω‚≈‰÷√
	}

}
