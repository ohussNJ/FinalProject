<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Seat class change portal</title>
</head>
<body>
<%
int ticketNum = Integer.parseInt(request.getParameter("ticketNum"));
String classnameReturn = request.getParameter("class");
int cancelFee = 0; 
if (classnameReturn.equals("economy")){
	cancelFee = 100;
	//out.print("Inside if statement");
}

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");
String query = "UPDATE ticket SET classtype=? WHERE ticketNum="+ticketNum;

PreparedStatement preparedStmt = con.prepareStatement(query);
preparedStmt.setString(1, classnameReturn);
preparedStmt.executeUpdate();

// Cancel fee=$0 if business or first. Cancel fee=$100 if economy
String query2="UPDATE ticket SET cancelfee=? WHERE ticketNum="+ticketNum;
PreparedStatement preparedStmt3 = con.prepareStatement(query2);
preparedStmt3.setInt(1, cancelFee);
preparedStmt3.executeUpdate();
%>
The seat class for the user has been changed
</body>
</html>