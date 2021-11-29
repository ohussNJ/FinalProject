<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search for question</title>
</head>
<body>
<%
String keyword=request.getParameter("keyword");
if(keyword.equals(""))
	keyword=" ";
		
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");

Statement stmt = con.createStatement();
String query="SELECT question, answer FROM faq WHERE question LIKE '%"+keyword.trim()+"%'"; 

ResultSet result = stmt.executeQuery(query);

out.print("<table>");

//make a row
out.print("<tr>");
//make a column
out.print("<td>");
out.print("Question");
out.print("</td>");
//make a column
out.print("<td>");
out.print("Answer");
out.print("</td>");
out.print("</tr>");

while (result.next()) {
	//make a row
	out.print("<tr>");
	//make a column
	out.print("<td>");

	out.print(result.getString("question"));
	out.print("</td>");
	out.print("<td>");


	out.print(result.getString("answer"));
	out.print("</td>");
	out.print("</tr>");

}
out.print("</table>");

%>
</body>
</html>