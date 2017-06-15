package com.TV_Show;
import java.io.*;  
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;  
import javax.servlet.http.*;  

public class Register extends HttpServlet {  
	public void doGet(HttpServletRequest request, HttpServletResponse response)  
			throws ServletException, IOException {  
		
		response.setContentType("text/html");  
		PrintWriter out = response.getWriter(); 
		ServletContext context = getServletContext();  
		String DBusername =context.getInitParameter("username");
		String DBpassword = context.getInitParameter("password");
		String url = context.getInitParameter("url");

		String fn=request.getParameter("firstname");  
		String e=request.getParameter("inputEmail");  
		String p=request.getParameter("inputPassword");
		try{  
			Class.forName("oracle.jdbc.driver.OracleDriver"); 
			Connection con=DriverManager.getConnection(url,DBusername,DBpassword);  
			Statement ps=con.createStatement();
			String Query = "insert into Register(UserID,FIRSTNAME,EMAIL,PASSWORD) VALUES(2','"+fn+"','"+e+"','"+p+"')";
			int result = ps.executeUpdate(Query);  
			if( result > 0)	{
				out.print("You are successfully registered..."); 
			}	      
				out.print("You are successfully registered...");      
		}catch (Exception e2) {System.out.println(e2);}  

		out.close();  
	}  
//(select max(CustomerID)+1 from customer)
}  