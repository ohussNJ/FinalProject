<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Airport Information</title>
</head>
<body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();

			String airportname = request.getParameter("airportname");
			String airportid = request.getParameter("airportid");
			String str = "INSERT into airport(airportid, airportname) values (?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(str);
			preparedStmt.setString(1, airportid);
			preparedStmt.setString(2, airportname);
			preparedStmt.executeUpdate();
			
			out.print("Airport with ID " + airportid + " and name " + airportname + " has been created.");

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>