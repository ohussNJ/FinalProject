<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Waitlist By Flight</title>
</head>
<body>
	<%
		try {
			//out.print("Check 1");
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//out.print("Check 2");
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			//out.print("Check 2.5");
			int entity = Integer.parseInt(request.getParameter("flightNum"));
			
			//out.print("Check 3: "+entity);
			
			String str = "select t.cid, u.lastname, u.firstname from ticket t join users u on t.cid=u.cid where t.flightNum=" + entity + " and t.waitlist=1";
			
			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);

			//Make an HTML table to show the results in:
			out.print("<table>");

			//make a row
			out.print("<tr>");
			//make a column
			out.print("<td>");
			out.print("CID");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Lastname");
			out.print("</td>");
			//make a column
			out.print("<td>");
			out.print("Firstname");
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
