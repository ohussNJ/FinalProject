<% 
com.cs336.pkg.ApplicationDB appdb = new com.cs336.pkg.ApplicationDB();
//use hidden values to get type of trip
String typeOfTrip = request.getParameter("typeOfTrip");
String flexible = request.getParameter("flexible");
String destAirport = request.getParameter("destAirport");
String originAirport = request.getParameter("originAirport");
int cid = Integer.parseInt(request.getParameter("cid"));

int isOneWay = 0;
if (typeOfTrip.equals("One Way")){
	isOneWay = 1;
}
int isFlex = 0; 
if(flexible.equals("flexible")){
	isFlex = 1; 
}
int flightNum = Integer.parseInt(request.getParameter("flightNum"));
float price = appdb.getFlightPrice(flightNum);
int flightNumReturn = -1;
float priceReturn = 0; 
int cancelFeeReturn = 0; 
String classnameReturn = request.getParameter("class2");
if (typeOfTrip.equals("Round Trip")){
	flightNumReturn = Integer.parseInt(request.getParameter("flightNumReturn"));
	priceReturn = appdb.getFlightPrice(flightNumReturn);
	if (classnameReturn.equals("Business")){
		cancelFeeReturn = 100; 
	}
}
String classname = request.getParameter("class");


int cancelFee = 0; 
if (classname.equals("Business")){
	cancelFee = 100; 
}



//String userid = (String)session.getAttribute("userid");
//int cid = appdb.getCid(userid); 

int isWaitlisted = 0; 
int isWaitlistedReturn = 0; 
isWaitlisted = appdb.saveTicket(cid, flightNum, isOneWay,classname, isFlex, cancelFee, price);
if (typeOfTrip.equals("Round Trip")){
	isWaitlistedReturn = appdb.saveTicket(cid, flightNumReturn, isOneWay,classnameReturn, isFlex, cancelFeeReturn, priceReturn);
}

%>


<title> Ticket Confirmation </title>

<p> Your Ticket Details: </p>
Flight Number: <%=flightNum %>
<p>From: <%=originAirport%> To: <%=destAirport%></p>
<%=classname %>
<%if (isWaitlisted == 0){ %>
	<p>Status: Booked</p> <%--change if waitlist --%> 
<% }
else {%>
	<p>Status: Waitlist</p> <%--change if waitlist --%>
<% }%>

<br> </br>
<%if (typeOfTrip.equals("Round Trip")){ 
	%>
	<p>Return Ticket</p>
	Flight Number: <%=flightNumReturn %>
	<p>From: <%=destAirport%> To: <%=originAirport%></p>
	<%=classnameReturn %>
	<%if (isWaitlistedReturn == 0){ %>
	<p>Status: Booked</p> <%--change if waitlist --%> 
<% }
else {%>
	<p>Status: Waitlist</p> <%--change if waitlist --%>
<% }	
}
%>

<a href="makeFlightRes.jsp">Book Another Flight</a>



