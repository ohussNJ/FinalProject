<%
    if ((session.getAttribute("user") == null)) {
%>
You are not logged in<br/>
<a href="index.jsp">Please Login</a>
<%} else {
%>

Welcome <%=session.getAttribute("user")%><br/>
<a href='logout.jsp'>Log out</a><br/>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br/>
<a href='makeFlightRes.jsp'>Make Reservation</a><br/>
<br>

View Past Or Upcoming Reservations?
<br>
	<form method="post" action="resUpcomingOrPast.jsp">
		<select name="timing">
			<option>past</option>
			<option>upcoming</option>
		</select><br/>
		Enter your CID to confirm:
		<table>
		<tr>
		<td><input type="text" name="cid"></td>
		</tr>
		</table>
		<input type="submit" value="Submit">
	</form>
<br>

Sort flights by price, take-off time, or landing time?
<br>
	<form method="post" action="sort.jsp">
		<select name="sort" size=1>
			<option value="price">sort by price</option>
			<option value="departuredate">sort by take-off time</option>
			<option value="destinationdate">sort by landing time</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Filter flights by price:
<br>
	<form method="post" action="filterPrice.jsp">
		<select name="price" size=1>
			<option value="300">$300 and under</option>
			<option value="500">$500 and under</option>
			<option value="501">$above 500</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Filter flights by number of stops:
<br>
	<form method="post" action="filterStops.jsp">
		<select name="stops" size=1>
			<option value="0">0</option>
			<option value="1">1</option>
			<option value="2">2 and above</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Filter the flights by airline:
<br>
	<form method="post" action="filterAirlines.jsp">
		<select name="airline" size=1>
			<option value="LH">Lufthansa</option>
			<option value="AM">American</option>
			<option value="DE">Delta</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Cancel flight reservations? Enter your ticket number:<br/>
<br>
	<form method="post" action="cancelReservation.jsp">
	<table>
	<tr>
	<td>ticket number</td><td><input type="text" name="ticketnum"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>

Waiting List
<br>
Enter the flight number and your id: 
<br>
	<form method="post" action="enterWaitingList.jsp">
	<table>
	<tr>
	<td>Flight Number</td><td><input type="text" name="flightNum"></td>
	</tr>
	<tr>
	<td>ID</td><td><input type="text" name="cid"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>

<%
    }
%>