<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*, java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<%
com.cs336.pkg.ApplicationDB appdb = new com.cs336.pkg.ApplicationDB();

int isinternational = Integer.parseInt(request.getParameter("isInter"));
int isdomestic = 0;
if(isinternational == 0){
	isdomestic = 1;
}
int numStops = Integer.parseInt(request.getParameter("stops"));
int price = Integer.parseInt(request.getParameter("price"));
String depAirport = request.getParameter("depAirport");
String destAirport = request.getParameter("destAirport");
String depDate = request.getParameter("depDate");
String destDate = request.getParameter("destDate");
String aircraftid = request.getParameter("aircraft");
String airlineid = request.getParameter("airlineid");
int flightNum = appdb.saveFlight(depDate, destDate, depAirport, destAirport, isinternational, isdomestic, price, numStops, aircraftid, airlineid);%>

A flight with the following information has been created:<br/>

<%out.println("Flight Number: " + flightNum);%><br/>
<%out.println("Airline: " + airlineid+"\n");%><br/>
<%out.println("Aircraft: " + aircraftid);%><br/>
<%out.println("Departure Date: " + depDate);%><br/>
<%out.println("Destination Date: " + destDate);%><br/>
<%out.println("Departure Airport: " + depAirport);%><br/>
<%out.println("Departure Airport: " + depAirport);%><br/>
<%if(isinternational == 1){
	out.println("Scope: international");
}
else{
	out.println("Scope: domestic");
}%><br/>
<%out.println("Price: " + price);%><br/>
<%out.println("Stops: " + numStops);%><br/>