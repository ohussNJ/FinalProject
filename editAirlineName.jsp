<%
com.cs336.pkg.ApplicationDB appdb = new com.cs336.pkg.ApplicationDB();

String airlineid = request.getParameter("airlineid");
String airlinename = request.getParameter("airlinename");

appdb.updateAirline(airlineid, airlinename);%>

The following airline information has been updated:<br/>

<%out.println("Airline ID: " + airlineid);%><br/>
<%out.println("Airline Name: " + airlinename);%><br/>