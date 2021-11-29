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
			//Get the combobox from the index.jsp
			int entity = Integer.parseInt(request.getParameter("stops"));
			String str = null;
			if (entity == 0){
				str = "select stops, flightNum, departuredate, destinationdate, price FROM flight WHERE stops = 0 ORDER by flightNum";
			} else if (entity == 1){
				str = "select stops, flightNum, departuredate, destinationdate, price FROM flight WHERE stops = 1 ORDER by flightNum";
			} else if (entity == 2) {
				str = "select stops, flightNum, departuredate, destinationdate, price FROM flight WHERE stops >= 2 ORDER by flightNum";
			}
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("Number of Stops");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Flight Number");
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
			out.print("Price");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");

				out.print(result.getString("stops"));
				out.print("</td>");
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

				out.print(result.getString("price"));
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