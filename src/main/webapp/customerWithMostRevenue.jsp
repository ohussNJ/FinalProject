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
			String str = "SELECT c.cid, c.lastname, c.firstname, sum(case when t.is_cancelled = 0 then (t.bookingcost+t.fare) else (t.bookingcost+t.cancelfee) end) AS revenue FROM ticket t join users c on (c.cid = t.cid) GROUP BY c.cid, c.lastname, c.firstname ORDER BY 4 DESC LIMIT 1";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			//print out column header
			out.print("CID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Last Name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("First Name");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Total Revenue");
			out.print("</td>");
			out.print("</tr>");

			//parse out the results
			while (result.next()) {
				//make a row
				out.print("<tr>");
				//make a column
				out.print("<td>");
				out.print(result.getString("cid"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("lastname"));
				out.print("</td>");
				out.print("<td>");
				out.print(result.getString("firstname"));
				out.print("</td>");
				out.print("<td>");
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