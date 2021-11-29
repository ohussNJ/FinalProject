<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Wait List Alerts</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");
Statement stmt = con.createStatement();

int customerid = Integer.parseInt(request.getParameter("cid"));

List<String> list = new ArrayList<String>();
String str="SELECT flightNum FROM ticket WHERE waitlist=1 and cid="+customerid;
ResultSet result = stmt.executeQuery(str);



while (result.next())
	list.add(result.getString("flightNum"));

//out.print(list);

out.print("<table>");

//make a row
out.print("<tr>");
//make a column
out.print("<td>");
//print out column header
out.print("Flight Number");
out.print("</td>");

//make a column
out.print("<td>");
out.print("Ticket Number");
out.print("</td>");
out.print("</tr>");

int i=0;
while (i< list.size()){
	String str2="SELECT flightNum, ticketNum FROM ticket WHERE is_cancelled=1 and flightNum="+list.get(i);
	i++;
	ResultSet result2 = stmt.executeQuery(str2);
	while (result2.next()){
		out.print("<tr>");
	//make a column
		out.print("<td>");

		out.print(result2.getString("flightNum"));
		out.print("</td>");
		out.print("<td>");

		out.print(result2.getString("ticketNum"));
		out.print("</td>");
		out.print("</tr>");
	}
}
out.print("</table>");

out.print(" ");
out.print("Alert: These flights are now available for reservation");

con.close();
%>
</body>
</html>