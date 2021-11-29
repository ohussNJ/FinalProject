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
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			String month = request.getParameter("month");
			String query = "SELECT t.datebought, f.flightNum, (t.bookingcost+t.fare) AS revenue FROM ticket t JOIN flight f ON (t.flightNum=f.flightNum) WHERE month(t.datebought)=" + month;
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(query);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("Date Bought");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Flight Num");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Revenue");
			out.print("</td>");
			//make a column
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				//Print out current schedule id:
				out.print(result.getString("datebought"));
				out.print("</td>");
				out.print("<td>");
				//Print out current destination date:
				out.print(result.getString("flightNum"));
				out.print("</td>");
				out.print("<td>");
				//Print out current departmentdate
				out.print(result.getString("revenue"));
				out.print("</td>");
				out.print("<td>");
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