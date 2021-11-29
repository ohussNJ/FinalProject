<%
com.cs336.pkg.ApplicationDB appdb = new com.cs336.pkg.ApplicationDB();

int flightnum = Integer.parseInt(request.getParameter("flightNum"));
String departureDate = request.getParameter("depDate");
String destinationDate = request.getParameter("destDate");
String departureAirport = request.getParameter("depAirport");
String destinationAirport = request.getParameter("destAirport");
int isInternational = Integer.parseInt(request.getParameter("isInter"));
int stops = Integer.parseInt(request.getParameter("numStops"));
int isDomestic = 0;
if(isInternational == 0){
	isDomestic = 1;
}

appdb.updateFlight(flightnum, departureDate, destinationDate, departureAirport, destinationAirport, isInternational, isDomestic);%>

The following flight information has been updated:<br/>

<%out.println("Flight Number: " + flightnum);%><br/>
<%out.println("Departure Date: " + departureDate);%><br/>
<%out.println("Destination Date: " + destinationDate);%><br/>
<%out.println("Departure Airport: " + departureAirport);%><br/>
<%out.println("Destination Airport: " + destinationAirport);%><br/>

<%if(isInternational == 1){
	out.println("Scope: International");
}
else{
	out.println("Scope: Domestic");
}%>