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
public class findCustomer extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		PrintWriter pw = response.getWriter();
		ServletContext context = getServletContext();
		//db confugration
		String url = context.getInitParameter("url");
		String DBusername =context.getInitParameter("username");
		String DBpassword = context.getInitParameter("password");
		String customer = request.getParameter("firstname");

		try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con=DriverManager.getConnection(url,DBusername,DBpassword);    
			Statement stmt=con.createStatement();  

			ResultSet rs=stmt.executeQuery("Select * From customer where firstname = '"+customer+"';"); 
			while(rs.next()){
				if(customer.equals(rs.getString("firstname"))){
					response.sendRedirect("home2.jsp");
				}
				else
				{				
					pw.print("<h>The customer does not exist</h6>");
				}

			}
		}catch(Exception e){
			System.out.println(e);
		} 
	}
}