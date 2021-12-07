<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add/Delete/Edit Airport</title>
</head>
<body>
Add/Delete/Edit Airport
<br>
<br>
	<form method="post" action=airportUpdate.jsp>
		Enter the Airport ID (needed for all updates):
		<table>
		<tr>
		<td><input type="text" name="airportID"></td>
		</tr>
		</table>
		Enter the Airport Name (needed for add and edit):
		<table>
		<tr>
		<td><input type="text" name="airportName"></td>
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