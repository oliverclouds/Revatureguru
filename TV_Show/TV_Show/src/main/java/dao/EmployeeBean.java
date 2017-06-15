package dao;

public class EmployeeBean{
	
	private int EmployeeId ;
	private String LastName;
	private String FirstName;
	private String Title;
	
	public EmployeeBean(int EmployeeId, String LastName,String FirstName,String Title) {
		super();
		this.EmployeeId = EmployeeId;
		this.LastName = LastName;
		this.FirstName = FirstName;
		this.Title = Title;
	}
	
	public int getEmployeeId() {
		return EmployeeId;
	}

	public void setEmployeeId(int employeeId) {
		EmployeeId = employeeId;
	}

	public String getLastName() {
		return LastName;
	}

	public void setLastName(String lastName) {
		LastName = lastName;
	}

	public String getFirstName() {
		return FirstName;
	}

	public void setFirstName(String firstName) {
		FirstName = firstName;
	}

	public String getTitle() {
		return Title;
	}

	public void setTitle(String title) {
		Title = title;
	}

	@Override
	public String toString() {
		return "EmployeeBean [EmployeeId=" + EmployeeId + ", LastName=" + LastName + ", FirstName=" + FirstName
				+ ", Title=" + Title + "]";
	}	
	
	
}
