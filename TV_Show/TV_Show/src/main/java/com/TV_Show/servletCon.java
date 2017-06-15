package com.TV_Show;
import java.sql.*;  
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

public class servletCon extends HttpServlet {
	String errorMsg="";
	private static final long serialVersionUID = 1L;
	public servletCon() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw = response.getWriter();
		ServletContext context = getServletContext();
		//db confugration
		String url = context.getInitParameter("url");
		String DBusername =context.getInitParameter("username");
		String DBpassword = context.getInitParameter("password");
		String useremail = request.getParameter("inputEmail");
		String userpassword = request.getParameter("inputPassword");


		try{  
			Class.forName("oracle.jdbc.driver.OracleDriver");  
			Connection con=DriverManager.getConnection(url,DBusername,DBpassword);    
			Statement stmt=con.createStatement();  
			//System.out.println("hjgh");
			ResultSet rs=stmt.executeQuery("select * from register"); 
			while(rs.next()){
					if(useremail.equals(rs.getString("email")) && userpassword.equals(rs.getString("password"))){
						response.sendRedirect("home2.jsp");
					}
					else
					{				
						pw.print("<h6 The email address or password you entered is not valid. Please try again.</h6>");
						//RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
						errorMsg="The email address or password you entered is not valid. Please try again";
						request.getSession().setAttribute("errorMsg", errorMsg);
						response.sendRedirect("error.jsp");
					}
				}
				//rs.getString(1);
			//pw.print(rs.getString(1) + rs.getString(2) + rs.getString(3) + rs.getString(4) +rs.getString(5)  );
			/*				if(Email.equals(rs.getString(1)) && password.equals(password)){
				response.sendRedirect("home.jsp");*/
			/*				}
				else
				{
				response.sendRedirect("error.jsp");
				}*/
			//rs.getString(1);

			/*if(Email.equals(rs.getString(1)) && userpassword.equals()){
				String myemail = rs.getString(1);

					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");	
					rd.forward(request, response);

				} */
			con.close();  
		}catch(Exception e){
			System.out.println(e);
		} 
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Session mysesion = Session.setAttribute("username", "bob");
	}

}
