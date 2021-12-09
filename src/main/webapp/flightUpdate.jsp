<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.sql.Time"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight update</title>
</head>
<body>
<%

String flightNum1=request.getParameter("flightNum");

String date=request.getParameter("departuredate");
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date dateStr = formatter.parse(date);
java.sql.Date departuredate1 = new java.sql.Date(dateStr.getTime());

String date2=request.getParameter("destinationdate");
SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date dateStr2 = formatter.parse(date2);
java.sql.Date destinationdate1 = new java.sql.Date(dateStr2.getTime());


String departureairport1=request.getParameter("departureairport");
String destinationairport1=request.getParameter("destinationairport");
String internation1=request.getParameter("isinternational");
String domestic1=request.getParameter("isdomestic");
String isinternational1="0";
String isdomestic1="0";
if(internation1.equals("Yes"))
{
	isinternational1="1";
}
if(domestic1.equals("Yes"))
{
	isdomestic1="1";
}
Float price1 = Float.parseFloat(request.getParameter("price"));
String stops1=request.getParameter("stops");

String time1=request.getParameter("takeoff_time");
SimpleDateFormat sdf = new SimpleDateFormat("hh:mm:ss");
//Date takeoff_time1 = sdf.parse(time1);
Time takeoff_time1=Time.valueOf(time1);



String time2=request.getParameter("landing_time");
SimpleDateFormat sdf2 = new SimpleDateFormat("hh:mm:ss");
//Date landing_time1 = sdf2.parse(time2);
Time landing_time1 = Time.valueOf(time2);


String aircraftid1=request.getParameter("aircraftid");
String airlineid1=request.getParameter("airlineid");

String option=request.getParameter("whichOption");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");

if(option.equals("delete"))
{
	String query = "DELETE FROM flight WHERE flightNum=?";
	PreparedStatement preparedStmt = con.prepareStatement(query);
	preparedStmt.setString(1, flightNum1);
	preparedStmt.executeUpdate();
}

if(option.equals("add"))
{	
	String query = "INSERT into flight(flightNum, departuredate, destinationdate, departureairport, destinationairport, isinternational, isdomestic, price, stops, takeoff_time, landing_time, aircraftid, airlineid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	PreparedStatement preparedStmt = con.prepareStatement(query);
	preparedStmt.setString(1, flightNum1);
    preparedStmt.setDate(2, departuredate1);
    preparedStmt.setDate(3, destinationdate1);
    preparedStmt.setString(4, departureairport1);
    preparedStmt.setString(5, destinationairport1);
    preparedStmt.setString(6, isinternational1);
    preparedStmt.setString(7, isdomestic1);
    preparedStmt.setFloat(8, price1);
    preparedStmt.setString(9, stops1);
    preparedStmt.setTime(10, takeoff_time1);
    preparedStmt.setTime(11, landing_time1);
    preparedStmt.setString(12, aircraftid1);
    preparedStmt.setString(13, airlineid1);
    preparedStmt.executeUpdate();
}

if(option.equals("edit"))
{
	String query = "UPDATE flight SET departuredate = ?, destinationdate = ?, departureairport = ?, destinationairport = ?, isinternational = ?, isdomestic = ?, price = ?, stops = ?, takeoff_time = ?, landing_time = ?, aircraftid = ?, airlineid = ? WHERE flightNum = '" + flightNum1 + "'";
	PreparedStatement preparedStmt = con.prepareStatement(query);
	//preparedStmt.setString(1, flightNum1);
    preparedStmt.setDate(1, departuredate1);
    preparedStmt.setDate(2, destinationdate1);
    preparedStmt.setString(3, departureairport1);
    preparedStmt.setString(4, destinationairport1);
    preparedStmt.setString(5, isinternational1);
    preparedStmt.setString(6, isdomestic1);
    preparedStmt.setFloat(7, price1);
    preparedStmt.setString(8, stops1);
    preparedStmt.setTime(9, takeoff_time1);
    preparedStmt.setTime(10, landing_time1);
    preparedStmt.setString(11, aircraftid1);
    preparedStmt.setString(12, airlineid1);
    preparedStmt.executeUpdate();
}

%>
Change made successfully.
</body>
</html>
