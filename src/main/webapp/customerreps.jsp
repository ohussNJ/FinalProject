<%@ page import ="java.sql.*" %>
<%
    String new_fn = request.getParameter("emp_username");  
    String lastn = request.getParameter("firstname");  
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");
    String query = "update employee set emp_username=? where firstname=?";

    // create the mysql insert preparedstatement
    PreparedStatement preparedStmt = con.prepareStatement(query);
    preparedStmt.setString(1, new_fn);
	preparedStmt.setString(2, lastn);
    // execute the Preparedstatement
    preparedStmt.executeUpdate();
    response.sendRedirect("successadmin.jsp");
    
%>