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
		/* Let people search for flights with flexible date/time */

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");	
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//Get the combobox from the index.jsp
			
			String str = "SELECT flightNum, departuredate, destinationdate, departureairport, destinationairport, airlineid FROM flight WHERE departuredate > sysdate()";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("flightNum");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("departuredate");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("destinationdate");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("departureairport");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("destinationairport");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("airlineid");
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