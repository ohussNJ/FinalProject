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
			String str = "SELECT f.flightNum, u.cid, t.ticketNum, f.airlineid, t.datebought, t.fare, f.departuredate, f.destinationdate, f.departureairport, f.destinationairport FROM ticket t JOIN flight f ON (f.flightNum=t.flightNum) JOIN users u ON (t.cid=u.cid) WHERE f.flightNum=" + flightNum;

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
			out.print("CID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Ticket Num");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Airline ID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Date Bought");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Fare");
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

				out.print(result.getString("cid"));
				out.print("</td>");
				out.print("<td>");

				out.print(result.getString("ticketNum"));
				out.print("</td>");
				out.print("<td>");

				out.print(result.getString("airlineid"));
				out.print("</td>");
				out.print("<td>");

				out.print(result.getString("datebought"));
				out.print("</td>");
				out.print("<td>");
				
				out.print(result.getString("fare"));
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