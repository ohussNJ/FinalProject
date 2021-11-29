<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Most Active Flights</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			//String entity = request.getParameter("price");
				
			String str = "SELECT f.flightNum, f.airlineid, f.departuredate, f.destinationdate, f.departureairport, f.destinationairport, count(*) AS tickets_sold from ticket t join flight f ON (t.flightNum = f.flightNum) GROUP BY f.flightNum, f.airlineid, f.departuredate, f.destinationdate, f.departureairport, f.destinationairport ORDER BY 7 DESC";
		
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
			out.print("Tickets Sold");
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

				out.print(result.getString("tickets_sold"));
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