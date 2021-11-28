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

			int ticketNum = Integer.parseInt(request.getParameter("ticketnum"));
			
			String str = "UPDATE ticket set is_cancelled = 1 WHERE ticketNum=?";
			PreparedStatement preparedStmt = con.prepareStatement(str);
			preparedStmt.setInt(1, ticketNum);
			preparedStmt.executeUpdate();
			
			//Create a SQL statement
			Statement stmt2 = con.createStatement();
			String str2 = "select classtype FROM ticket WHERE ticketNum="+ticketNum;
			//Run the query against the database.
			ResultSet result2 = stmt2.executeQuery(str2);
			result2.next();
			String classname = result2.getString("classtype");
			
			if (classname.equals("business") || classname.equals("first")){
				out.print("Your ticket has been cancelled. No cancellation fee applied.");
			} else {
				out.print("Your ticket has been cancelled. Cancellation fee applied.");
			}
			

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>