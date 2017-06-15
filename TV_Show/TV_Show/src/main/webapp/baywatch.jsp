<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Baywatch</title>
</head>
<body>


<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
<link href="css/table.css" rel="stylesheet">
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="css/ie10-viewport-bug-workaround.css" rel="stylesheet">
</head>
<body>
	<div class="navbar-wrapper">
		<div class="container">

			<nav class="navbar navbar-inverse navbar-static-top">
				<div class="container">
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse" data-target="#navbar"
							aria-expanded="false" aria-controls="navbar">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="home2.jsp">MovieTube</a>

					</div>
					<div id="navbar" class="navbar-collapse collapse">
						<ul class="nav navbar-nav">
							<li class="active"><a href="home2.jsp">Home</a></li>
							<li><a href="movies.jsp">Movies</a></li>
							<li><a href="genre.jsp">Genre</a></li>
							<li><a href="search.jsp">Search</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Dropdown <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li role="separator" class="divider"></li>
									<li class="dropdown-header">Nav header</li>
									<li><a href="#">Separated link</a></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
							<li><a  href="home1.jsp">Logout</a></li>
						</ul>
					</div>
				</div>
			</nav>

		</div>
	</div>


	<%
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "TV_Show";
		String password = "oliver";

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
	%>
	<a value="Back" herf="invoice.jsp"></a>
	<h2 id="containerfind" align="center">
		<div align="left">
			<a href="search.jsp">back</a>
		</div>
		<font><strong>Baywatch Invoice </strong></font>
	</h2>

	<table align="center" cellpadding="5" cellspacing="5" border="1">
		<tr>

		</tr>
		<tr bgcolor="#A52A2A">
			<td><b>MOVIEID</b></td>
			<td><b>TITLE</b></td>
			<td><b>GENRE</b></td>
			<td><b>PRICE</b></td>
			
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl, userId, password);
				statement = connection.createStatement();
				String sql = "Select * From MOVIE where MovieID = 4";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr bgcolor="#DEB887">

			<td><%=resultSet.getString("MOVIEID")%></td>
			<td><%=resultSet.getString("TITLE")%></td>
			<td><%=resultSet.getString("GENRE")%></td>
			<td><%=resultSet.getString("PRICE")%></td>
			

		</tr>

		<%
			}

			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	<style>
#containerfind {
	padding: 30px;
	margin-top: 60px;
}
</style>


</body>
</html>