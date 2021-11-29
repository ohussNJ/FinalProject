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
<h1> Make a Flight </h1>
<%

ApplicationDB appdb = new com.cs336.pkg.ApplicationDB();

String airlineid = request.getParameter("airlineid");

Map<String, String> airports = appdb.getAirports();
Map<String, String> aircrafts = appdb.getAircraftsFromAirline(airlineid);

%>
<form action="saveFlightEntry.jsp" method="POST">
	<input type="hidden" id="airline" name="airlineid" value="<%=airlineid%>">
	<p>Departure Date: <input name="depDate"></input> </p>
	<p>Destination Date:<input name="destDate"></input> </p>
	<p>International flight? Enter 1 for yes, 0 for no:<input name="isInter"></input> </p>
	<p>Price:<input name="price"></input> </p>
	<p>Number of Stops:<input name="stops"></input> </p>
	
<p>Select Aircraft</p>
<select name="aircraft">
 <% 
 for (Map.Entry mapElement : aircrafts.entrySet()) {
%>
  <option value="<%=mapElement.getKey()%>"><%=mapElement.getKey()%> - <%=mapElement.getValue()%></option>
<% } %>
</select>

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

<p>
<input type="submit" value="Submit"/>
</p>

</form>  

</body>
</html>