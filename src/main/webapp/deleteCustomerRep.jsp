<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Delete Reservation</title>
</head>
<body>
	<%
		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			
			//Create a SQL statement
			Statement stmt = con.createStatement();
			int empid = Integer.parseInt(request.getParameter("eid"));
			String str = "SELECT eid, firstname, lastname, emp_username FROM employee WHERE eid=" + empid;

			//Run the query against the database.
			ResultSet result = stmt.executeQuery(str);
			result.next();%>
			
			<h1>Customer Representative Details</h1>
			
			<%out.println("EID: "+result.getString("eid"));%><br/>
			<%out.println("First Name: "+result.getString("firstname"));%><br/>
			<%out.println("Last Name: "+result.getString("lastname"));%><br/>
			<%out.println("Username: "+result.getString("emp_username"));%><br/>

			<br><form action="confirmDeleteCustomerRep.jsp" method="POST">
			<input type="hidden" id="emp" name="eid" value="<%=empid%>">
			<p>Please confirm deleting this customer representative: <input type="submit" value="Delete"/></p>
			</form><br/>
	
			<%//close the connection.
			con.close();

		} catch (Exception e) {
			out.println("error in select" + e);
		}
	%>

</body>
</html>