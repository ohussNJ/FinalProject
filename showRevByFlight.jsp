<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			int flightNum = Integer.parseInt(request.getParameter("entity"));
			String str=null;
			
			str = "select t.flightNum, f.airlineid, f.departureairport, f.destinationairport, date_format(t.datebought, '%Y-%m') booking_mth, sum(case when t.is_cancelled = 0 then (t.bookingcost+t.fare) else (t.bookingcost+ t.cancelfee) end ) as revenue from ticket t join flight f ON (t.flightNum = f.flightNum) where f.flightNum="+flightNum+" group by t.flightNum, f.airlineid, f.departureairport, f.destinationairport, date_format(t.datebought, '%Y-%m')";

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Flight Num");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Airline ID");
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
			out.print("Month");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Revenue");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");

				out.print(result.getString("flightNum"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("airlineid"));
				out.print("</td>");
				out.print("<td>");
				//Print out current dest date
				out.print(result.getString("departureairport"));
				out.print("</td>");
				out.print("<td>");
				//Print out current departure date
				out.print(result.getString("destinationairport"));
				out.print("</td>");
				out.print("<td>");
				//Print out current departure date
				out.print(result.getString("booking_mth"));
				out.print("</td>");
				out.print("<td>");
				//Print out current departure date
				out.print(result.getString("revenue"));
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