<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Answer</title>
</head>
<body>
Your answer was added to the question. 
<%
//ApplicationDB db = new ApplicationDB();	
//Connection con = db.getConnection();
String originalQuestion = request.getParameter("Question");
String ans=request.getParameter("Answer");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");

//Statement st=con.createStatement();
//int x= st.executeUpdate("DELETE FROM faq WHERE question="+originalQuestion);
//String del="DELETE FROM faq WHERE question="+originalQuestion;

//String query = "UPDATE faq SET (answer) VALUES (?) WHERE question='"+originalQuestion+"'";
String query = "INSERT INTO faq (answer) VALUES (?) WHERE question="+originalQuestion;
PreparedStatement preparedStmt = con.prepareStatement(query);
preparedStmt.setString(1, ans);
preparedStmt.setString(2, originalQuestion);
preparedStmt.executeUpdate();
%>

</body>
</html>