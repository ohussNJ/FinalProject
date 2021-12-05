<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancel Flight on behalf of the customer</title>
</head>
<body>
Cancel Flight for the user:<br/>
	<form method="post" action="cancelReservation.jsp">
	<table>
	<tr>
	<td>Customer ID</td><td><input type="text" name="CustomerID"></td>
	<td>Ticket Number</td><td><input type="text" name="ticketnum"></td>
	</tr>
	</table>
	<input type="submit" value="submit">
	</form>
<br>
</body>
</html>