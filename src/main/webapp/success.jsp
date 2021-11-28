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

Past/Upcoming Reservations
<br>
	<form method="post" action="resUpcomingOrPast.jsp">
		<select name="timing">
			<option>Past</option>
			<option>Upcoming</option>
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

Sort By: Price, Take-off Time, Landing Time
<br>
	<form method="post" action="sort.jsp">
		<select name="sort" size=1>
			<option value="price">Price</option>
			<option value="departuredate">Take-off Time</option>
			<option value="destinationdate">Landing Time</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Filter By: Price
<br>
	<form method="post" action="filterPrice.jsp">
		<select name="price" size=1>
			<option value="300"><=$300</option>
			<option value="500"><=$500</option>
			<option value="501">>500</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Filter By: Stops
<br>
	<form method="post" action="filterStops.jsp">
		<select name="stops" size=1>
			<option value="1">1</option>
			<option value="2">2</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Filter By: Airline
<br>
	<form method="post" action="filterAirlines.jsp">
		<select name="airline" size=1>
			<option value="NY">New York Airport</option>
			<option value="LA">Los Angeles Airport</option>
			<option value="NW">Newark Airport</option>
			<option value="LO">London Intl Airport</option>
		</select>&nbsp;<br> <input type="submit" value="submit">
	</form>
<br>

Cancel Flight:<br/>
<br>
	<form method="post" action="cancelReservation.jsp">
	<table>
	<tr>
	<td>Ticket Number</td><td><input type="text" name="ticketnum"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>

Waiting List:
<br>
	<form method="post" action="enterWaitingList.jsp">
	<table>
	<tr>
	<td>Flight Number</td><td><input type="text" name="flightNum"></td>
	</tr>
	<tr>
	<td>CID</td><td><input type="text" name="cid"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>

<%
    }
%>