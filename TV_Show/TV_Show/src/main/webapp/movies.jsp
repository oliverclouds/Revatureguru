<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>


<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>MovieTube</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/table.css" rel="stylesheet">
<link href="css/carousel.css" rel="stylesheet">
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
							<li><a href="Actor.jsp">Actor</a></li>
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
		String id = request.getParameter("userId");
		String driverName = "oracle.jdbc.driver.OracleDriver";
		String connectionUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		/* String dbName = "jsptutorials"; */
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
	<h2 align="center">
		<font><strong>Movies</strong></font>
	</h2>
.
	<table id="mytable" align="center" cellpadding="5" cellspacing="5"
		border="1"background-color: "gray";>
		<tr>

		</tr>
		<tr bgcolor="white">
			<td><b>MovieID</b></td>
			<td><b>Title</b></td>
			<td><b>Genre</b></td>
			<td><b>Price</b></td>
			<td><b>Edit</b></td>
			<td><b>Delete</b></td>
		</tr>
		<%
			try {
				connection = DriverManager.getConnection(connectionUrl, userId, password);
				statement = connection.createStatement();
				String sql = "SELECT * FROM movie";

				resultSet = statement.executeQuery(sql);
				while (resultSet.next()) {
		%>
		<tr bgcolor="white">

			<td><%=resultSet.getString("movieID")%></td>
			<td><%=resultSet.getString("title")%></td>
			<td><%=resultSet.getString("genre")%></td>
			<td><%=resultSet.getString("price")%></td>
			<td><button>edit</button></td>
			<td><button onclick="myDeleteFunction()">Delete row</button></td>
			
		</tr>
		<%
			}
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
		<input type="text" id="myInput" onkeyup="myFunction()"
			placeholder="Search for title.." title="Type in a name">
	<script>
	function myDeleteFunction() {
	    document.getElementById("mytable").deleteRow(2);
	}
		function myFunction() {
			var input, filter, table, tr, td, i;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("mytable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
	<style>
	#containerfind {
	padding: 30px;
	margin-top: 60px;
}
</style>
</body>
</html>