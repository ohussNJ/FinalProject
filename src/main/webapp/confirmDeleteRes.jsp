<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sort Flights</title>
</head>
<body>
	<%
		try {
			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			String str = "DELETE FROM ticket WHERE ticketNum=?";
			PreparedStatement stmt = con.prepareStatement(str);
			int ticketnumber = Integer.parseInt(request.getParameter("ticketNum"));
			stmt.setInt(1,ticketnumber);
			
			//Run the query against the database.
			stmt.executeUpdate();
			
			out.print("The ticket has been deleted.");

			//close the connection.
			con.close();

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>