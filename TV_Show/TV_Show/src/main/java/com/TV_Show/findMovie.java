package com.TV_Show;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class findCustomer
 */
public class findMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		PrintWriter pw = response.getWriter();
		String customer = request.getParameter("firstname");
		
				if(customer.equals("baywatch")){
					response.sendRedirect("baywatch.jsp");
				}
				else if (!customer.equals("baywatch")){
					response.sendRedirect("search.jsp");
				}
	}
}