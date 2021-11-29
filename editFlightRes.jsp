<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Flight Reservations</title>
</head>
<body>
<h1> Edit Flight Reservations</h1>
<%
List<String> classTypes = Arrays.asList("ECONOMY", "BUSINESS");
ApplicationDB appdb = new com.cs336.pkg.ApplicationDB(); 
%>

<form action="updateNewReservation.jsp" method="POST">
<p>Enter ticket number: <input name="ticketNum"></input> </p>

<p>Select Class:</p>
<select name="classType">
<% 
  for (String item: classTypes) {
%>
  <option value="<%=item%>"><%=item%></option>
<% } %>
</select>

<p>Cancel reservation? (enter 1 for yes or 0 for no) <input name="isCancel"></input> </p>
<p>Flexibility: (enter 1 for yes or 0 for no) <input name="isFlex"></input> </p>

<p>
<input type="submit" value="Submit"/>
</p>

</form>

</body>
</html>