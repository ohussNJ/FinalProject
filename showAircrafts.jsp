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
			String airlineid = request.getParameter("airline");
			Random random = new Random();
			int num = random.nextInt(100000);
			String aircraftid = ""+airlineid+num;
			String str = "INSERT into aircraft (aircraftid, airlineid) values (?, ?)";
			PreparedStatement preparedStmt = con.prepareStatement(str);
			preparedStmt.setString(1, aircraftid);
			preparedStmt.setString(2, airlineid);
			preparedStmt.executeUpdate();
			
			out.print("Aircraft with ID " + aircraftid + " has been created.");

		} catch (Exception e) {
			out.print(e);
		}
	%>

</body>
</html>