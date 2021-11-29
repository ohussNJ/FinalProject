<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Airport Name</title>
</head>
<body>
<h1> Edit Airport Name </h1>
<%
ApplicationDB appdb = new com.cs336.pkg.ApplicationDB(); 
Map<String, String> airports = appdb.getAirports();
%>

<form action="editAirportName.jsp" method="POST">

<p>Select Airport:</p>
<select name="airportid">
<% 
for (Map.Entry mapElement : airports.entrySet()) {
%>
<option value="<%=mapElement.getKey()%>"><%=mapElement.getKey()%> - <%=mapElement.getValue()%></option>
<% } %>
</select>

<p>Rename Airport:<input name="airportname"></input> </p>

<p>
<input type="submit" value="Submit"/>
</p>
</form>
  


</body>
</html>