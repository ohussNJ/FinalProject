<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Question</title>
</head>
<body>
Your question was added. 
<%
//ApplicationDB db = new ApplicationDB();	
//Connection con = db.getConnection();

String question=request.getParameter("question");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");
String query = "INSERT INTO faq (question) VALUES (?)";
PreparedStatement preparedStmt = con.prepareStatement(query);
preparedStmt.setString(1, question);
preparedStmt.executeUpdate();
%>

</body>
</html>