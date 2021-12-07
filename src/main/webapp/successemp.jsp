<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

<%
List<String> tripTypes = Arrays.asList("One Way", "Round Trip");
ApplicationDB appdb = new com.cs336.pkg.ApplicationDB(); 
Map<String, String> questions = appdb.getQuestions();
for (Map.Entry mapElement : questions.entrySet()) {
	//out.println(mapElement.getKey());
}
%>

Welcome <%=session.getAttribute("user")%><br/>
<a href='logout.jsp'>Log out</a><br/>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>

<a href='makeFlightResForCustomer.jsp'>Make Reservation for Customer</a><br/>
<br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>

Edit Flight reservations for a customer: Cancel flight or change seat type
<br>
<a href='cancelFlightForCustomer.jsp'>Cancel flight for a customer</a><br/>
<a href='changeSeatForCustomer.jsp'>Change seat type for a customer</a><br/>

<br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>

Add, Edit, Delete information for aircrafts, airports, and flights 
<br>
<a href='add_edit_delete_airport.jsp'>Add, Edit, Delete information for Airports</a><br/>
<a href='add_edit_delete_aircraft.jsp'>Add, Edit, Delete information for Aircrafts</a><br/>
<a href='add_edit_delete_flights.jsp'>Add, Edit, Delete information for Flights</a><br/>

<br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>

Retrieve Waiting List for Flight
<br>
	<form method="post" action="retrieveWaitlist.jsp">
		Enter the Flight number:
		<table>
		<tr>
		<td><input type="text" name="flightNum"></td>
		</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
<br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>

Produce List of all flights for a given airport (departing and arriving): Example-JFK
<br>
	<form method="post" action="AllFlightsForAirport.jsp">
		Enter the Airport name:
		<table>
		<tr>
		<td><input type="text" name="Airport_name:"></td>
		</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
<br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>

Answer questions from customers

<br>
	<form method="post" action="addAnswer.jsp">
		<select name="Question">
	 <% 
	
 	for (Map.Entry mapElement : questions.entrySet()) {
	%>
 	 <option value="<%=mapElement.getKey()%>"><%=mapElement.getKey()%> - <%=mapElement.getValue()%></option>
	<% } %>
	</select><br>
		
Enter answer to selected question:
		<table>
		<tr>
		<td><input type="text" name="Answer"></td>
		</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
<br>
<%
    }
%>
