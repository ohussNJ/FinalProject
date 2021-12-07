<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change the seat class for the customer</title>
</head>
<body>
Work in progress

<br>
	<form method="post" action="changeSeatClass.jsp">
		Enter the customer's ticket number/ID:
		<table>
		<tr>
		<td><input type="text" name="ticketNum"></td>
		</tr>
		</table>
		<input type="submit" value="Submit">
		
	<select name = "class">
	<option value = "economy">Economy</option>
	<option value = "business">Business</option>
	<option value = "first">First Class</option>
</select>
	</form>
<br>
</body>
</html>
