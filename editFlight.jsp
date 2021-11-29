<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Edit Flight </title>
</head>
<body>
<h1> Edit Flight Information </h1>

<%
ApplicationDB appdb = new com.cs336.pkg.ApplicationDB(); 
Map<String, String> airports = appdb.getAirports();
%>

<form action="editFlightInfo.jsp" method="POST">
	<p>Enter Flight Number: <input name="flightNum"></input></p>
	<p>Enter new Departure Date: <input name="depDate"></input> </p>
	<p>Enter new Destination Date: <input name="destDate"></input></p>
	
	<p>Select Departure Airport:</p>
	<select name="depAirport">
 	<% 
 	for (Map.Entry mapElement : airports.entrySet()) {
	%>
  	<option value="<%=mapElement.getKey()%>"><%=mapElement.getKey()%> - <%=mapElement.getValue()%></option>
	<% } %>
	</select>

	<p>Select Destination Airport:</p>
	<select name="destAirport">
 	<% 
 	for (Map.Entry mapElement : airports.entrySet()) {
	%>
  	<option value="<%=mapElement.getKey()%>"><%=mapElement.getKey()%> - <%=mapElement.getValue()%></option>
	<% } %>
	</select>
	
	<p>International Flight? <input name="isInter"></input></p>
	<p>Number of Stops: <input name="numStops"></input></p>
<p>
<input type="submit" value="Submit"/>
</p>

</form>
  


</body>
</html>