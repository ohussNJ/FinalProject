<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Airports</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String airportID = request.getParameter("airportid");
			String str = "SELECT airportid, airportname FROM airport WHERE airportid= '" + airportID + "'";
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			result.next();%>
			
			<h1>Airport Details</h1>
			
			<%out.println("Airport ID: "+result.getString("airportid"));%><br/>
			<%out.println("Airport Name: "+result.getString("airportname"));%><br/>


			<br><form action="confirmDeleteAirport.jsp" method="POST">
			<input type="hidden" id="emp" name="airportid" value="<%=airportID%>">
			<p>Please confirm deleting this airport: <input type="submit" value="Delete"/></p>
			</form><br/>
	
			<%//close the connection.
			con.close();
		} catch (Exception e) {
			out.println("error in select" + e);
		}
	%>

</body>
</html>