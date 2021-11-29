<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Reservation</title>
</head>
<body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			int ticketnum = Integer.parseInt(request.getParameter("ticketNum"));
			String str = "SELECT t.ticketNum,  u.cid, f.flightNum, f.airlineid, f.departuredate, f.destinationdate, f.departureairport, f.destinationairport, t.seatnum, t.classtype, t.fare, t.datebought FROM ticket t JOIN flight f ON (f.flightNum=t.flightNum) JOIN users u ON (t.cid=u.cid) WHERE t.ticketNum=" + ticketnum;

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			result.next();%>
			
			<h1>Ticket Details</h1>
			
			<%out.println("Ticket Num: "+ result.getString("ticketNum"));%><br/>
			<%out.println("CID: "+result.getString("cid"));%><br/>
			<%out.println("Flight Num: "+result.getString("flightNum"));%><br/>
			<%out.println("Airline ID: "+result.getString("airlineid"));%><br/>
			<%out.println("Departure Date: "+result.getString("departuredate"));%><br/>
			<%out.println("Destination Date: "+result.getString("destinationdate"));%><br/>
			<%out.println("Departure Airport: "+result.getString("departureairport"));%><br/>
			<%out.println("Destination Airport: "+result.getString("destinationairport"));%><br/>
			<%out.println("Seat Number: "+result.getString("seatnum"));%><br/>
			<%out.println("Class Type: "+result.getString("classtype"));%><br/>
			<%out.println("Fare: "+result.getString("fare"));%><br/>
			<%out.println("Date Bought: "+result.getString("datebought"));%><br/>

			<br><form action="confirmDeleteRes.jsp" method="POST">
			<input type="hidden" id="ticket" name="ticketNum" value="<%=ticketnum%>">
			<p>Please confirm deleting this ticket: <input type="submit" value="Delete"/></p>
			</form><br/>
	
			<%//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>