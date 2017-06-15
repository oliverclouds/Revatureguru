package dao;
import java.util.List;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
public class EmployeeImplementation implements Employee{
	public static List<EmployeeBean> retrieveApisodeValues1() {
		List<EmployeeBean> t1 = new ArrayList<EmployeeBean>();
		Connection conn = ConnectionUtil.getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from Employee");
			while(rs.next()){
				int EmployeeId = rs.getInt("EmployeeId") ;
				String LastName = rs.getString("LastName");
				String FirstName = rs.getString("FirstName");
				String Title = rs.getString("Title");
				EmployeeBean T1 = new EmployeeBean(EmployeeId, LastName, FirstName, Title);
				t1.add(T1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return t1;
	}

	
	@Override
	public List<EmployeeBean> retrieveApisodeValues() {
		// TODO Auto-generated method stub
		return null;
	}
}
