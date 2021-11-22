<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Reservations</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String entity = request.getParameter("timing");
			int customerid = Integer.parseInt(request.getParameter("cid"));
			String str=null;
			if(entity.equals("past")){
				str = "SELECT t.ticketNum, (case when t.waitlist = 1 then ('On Waiting List') else ('Confirmed') end) AS tStatus, (case when t.is_oneway = 1 then ('One-way') else ('Round-trip') end) AS resType, f.departuredate, f.destinationdate, f.departureairport, f.destinationairport, f.airlineid, t.seatnum, t.fare FROM ticket t JOIN flight f ON t.flightNum=f.flightNum WHERE f.departuredate < sysdate() and cid=" + customerid;
			}
			else {
				str = "SELECT t.ticketNum, (case when t.waitlist = 1 then ('On Waiting List') else ('Confirmed') end) AS tStatus, (case when t.is_oneway = 1 then ('One-way') else ('Round-trip') end) AS resType, f.departuredate, f.destinationdate, f.departureairport, f.destinationairport, f.airlineid, t.seatnum, t.fare FROM ticket t JOIN flight f ON t.flightNum=f.flightNum WHERE f.departuredate >= sysdate() and cid=" + customerid;
			}
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Ticket Num");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Ticket Status");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Reservation Type");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Date");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Destination Date");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Departure Airport");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Destination Airport");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Airline ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Seat Num");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Fare");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				
				out.print("<td>");
				out.print(result.getString("ticketNum"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("tStatus"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("resType"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("departuredate"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("destinationdate"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("departureairport"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("destinationairport"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("airlineid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("seatnum"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("fare"));
				out.print("</td>");
				out.print("</tr>");

			}
			out.print("</table>");

			//close the connection.
			con.close();

		} catch (Exception e) {
		}
	%>

</body>
</html>