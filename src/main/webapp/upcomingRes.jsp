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
		/* View all upcoming reservations with their details */

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String entity = request.getParameter("customerid");
			
			String str = "SELECT t.datebought, t.ticketNum, t.isFlexible, t.bookingcost, t.numflights, t.seatnum, t.fare FROM ticket t WHERE datediff(datebought, sysdate) < 0 and t.cid=" + entity +";";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("datebought");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("ticketNum");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("isFlexible");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("bookingcost");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("numflights");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("seatnum");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("fare");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(result.getString("t.datebought"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("t.ticketNum"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("t.isFlexible"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("t.bookingcost"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("t.numflights"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("t.seatnum"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("t.fare"));
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