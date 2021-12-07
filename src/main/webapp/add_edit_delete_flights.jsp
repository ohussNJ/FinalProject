<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add/Delete/Edit Flights</title>
</head>
<body>
Add/Delete/Edit Flights
<br>
<br>
	<form method="post" action=flightUpdate.jsp>
		Enter the Flight number (needed for all updates):
		<table>
		<tr>
		<td><input type="text" name="flightNum"></td>
		</tr>
		</table>
		
		Enter Departure Date (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="departuredate"></td>
		</tr>
		</table>
		
		Enter Destination Date (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="destinationdate"></td>
		</tr>
		</table>
		
		Enter Departure Airport (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="departureairport"></td>
		</tr>
		</table>
		
		Enter Destination Airport (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="destinationairport"></td>
		</tr>
		</table>
		
		International: Yes or No (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="isinternational"></td>
		</tr>
		</table>
		
		Domestic: Yes or No (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="isdomestic"></td>
		</tr>
		</table>
		
		Price (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="price"></td>
		</tr>
		</table>
		
		Number of stops (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="stops"></td>
		</tr>
		</table>
		
		Take off time (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="takeoff_time"></td>
		</tr>
		</table>
		
		Landing time (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="landing_time"></td>
		</tr>
		</table>
		
		Aircraft ID (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="aircraftid"></td>
		</tr>
		</table>
		
		Airline ID (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="airlineid"></td>
		</tr>
		</table>
		
		
		<input type="submit" value="Submit">
		
		<select name = "whichOption">
		<option value = "add">Add</option>
		<option value = "delete">Delete</option>
		<option value = "edit">Edit</option>
</select>
	</form>
<br>


</body>
</html>