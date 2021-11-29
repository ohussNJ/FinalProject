<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirm delete airport</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			String str = "DELETE FROM airport WHERE airportid=?";
			PreparedStatement stmt = con.prepareStatement(str);
			String airportidval = request.getParameter("airportid");
			stmt.setString(1, airportidval);

			//Run the query against the database.
			stmt.executeUpdate();
			
			out.print("The airport has been deleted.");
			//close the connection.
			con.close();
		} catch (Exception e) {
			out.print("error in delete" + e);
		}
	%>

</body>
</html>