<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Make a Flight</title>
</head>
<body>
<h1> Add a Flight </h1>
<%
ApplicationDB appdb = new com.cs336.pkg.ApplicationDB(); 
Map<String, String> airlines = appdb.getAirlines();
%>

<form action="createFlights.jsp" method="POST">
	<p>Select Airline</p>
	<select name="airlineid">
<% 
for (Map.Entry mapElement : airlines.entrySet()) {
%>
  <option value="<%=mapElement.getKey()%>"><%=mapElement.getKey()%> - <%=mapElement.getValue()%></option>
<% } %>
</select>
<p>
<input type="submit" value="Submit"/>
</p>

</form>
  


</body>
</html>

