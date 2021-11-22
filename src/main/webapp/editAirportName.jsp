<%
com.cs336.pkg.ApplicationDB appdb = new com.cs336.pkg.ApplicationDB();

String airportid = request.getParameter("airportid");
String airportname = request.getParameter("airportname");

appdb.updateAirport(airportid, airportname);%>

The following airport information has been updated:<br/>

<%out.println("Airport ID: " + airportid);%><br/>
<%out.println("Airport Name: " + airportname);%><br/>