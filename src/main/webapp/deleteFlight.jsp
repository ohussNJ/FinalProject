<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Flight</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			int flightid = Integer.parseInt(request.getParameter("flightNum"));
			String str = "SELECT flightNum, departuredate, destinationdate,departureairport,destinationairport, isinternational, price, stops, aircraftid, airlineid FROM flight WHERE flightNum=" + flightid;
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			result.next();%>
			
			<h1>Flight Details</h1>
			
			<%out.println("flightNum: "+result.getString("flightNum"));%><br/>
			<%out.println("departuredate: "+result.getString("departuredate"));%><br/>
			<%out.println("destinationdate: "+result.getString("destinationdate"));%><br/>
			<%out.println("departureairport: "+result.getString("departureairport"));%><br/>
			<%out.println("destinationairport: "+result.getString("destinationairport"));%><br/>
			<%out.println("destinationairport: "+result.getString("isinternational"));%><br/>
			<%out.println("destinationairport: "+result.getString("price"));%><br/>
			<%out.println("destinationairport: "+result.getString("stops"));%><br/>
			<%out.println("aircraftid: "+result.getString("aircraftid"));%><br/>
			<%out.println("airlineid: "+result.getString("airlineid"));%><br/>

			<br><form action="confirmDeleteFlight.jsp" method="POST">
			<input type="hidden" id="flight" name="flightNum" value="<%=flightid%>">
			<p>Please confirm deleting this flight: <input type="submit" value="Delete"/></p>
			</form><br/>
	
			<%//close the connection.
			con.close();
		} catch (Exception e) {
			out.println("error in select" + e);
		}
	%>

</body>
</html>