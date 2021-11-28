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
			//Get the combobox from the index.jsp
			String ticketnum = request.getParameter("ticketNum");
			int cid = Integer.parseInt(request.getParameter("cid"));
			String insert = "INSERT INTO ticket (waitlist, cid)" + "VALUES(?,?)" ;
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);
			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setBoolean(1, true);
			ps.setInt(2, cid);
			//Run the query against the DB
			ps.executeUpdate();
			//Close the connection
			con.close();
			out.print("You have been added to the waiting list");			
		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>