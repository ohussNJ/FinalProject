<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add/Delete/Edit Aircraft</title>
</head>
<body>
Add/Delete/Edit Aircraft
<br>
<br>
	<form method="post" action=aircraftUpdate.jsp>
		Enter the Aircraft ID (needed for all updates):
		<table>
		<tr>
		<td><input type="text" name="aircraftID"></td>
		</tr>
		</table>
		Enter the Airline Name (needed for add and edit):
		
		<select name="airlineName">
		<option value = "NY">New York Airport</option>
		<option value = "LA">Los Angeles Airport</option>
		<option value = "NW">Newark Airport</option>
		<option value = "LO">London Intl Airport</option>
		</select><br/>
	</select><br>
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