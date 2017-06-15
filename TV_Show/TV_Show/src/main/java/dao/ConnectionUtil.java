package dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionUtil {
	public static Connection getConnection(){
		   String databaseURL = "jdbc:oracle:thin:@localhost:1521:xe";
	        String user = "TV_Show";
	        String password = "oliver";
	        Connection conn = null;
	        try {
	            Class.forName("oracle.jdbc.driver.OracleDriver");
	            conn = DriverManager.getConnection(databaseURL, user, password);
	            if (conn != null) {
	                System.out.println("Connected to the database");
	            }
	        } catch (ClassNotFoundException ex) {
	            System.out.println("Could not find database driver class");
	            ex.printStackTrace();
	        } catch (SQLException ex) {
	            System.out.println("An error occurred. Maybe user/password is invalid");
	            ex.printStackTrace();
	        } finally {
	            if (conn != null) {
	            }
	        }
			return conn;
	    }
	}

