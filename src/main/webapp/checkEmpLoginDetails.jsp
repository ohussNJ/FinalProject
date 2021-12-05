<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("emp_username");   
    String pwd = request.getParameter("emp_password");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/airlinedb","root","password");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from employee where emp_username='" + userid + "' and emp_password='" + pwd + "'");
    if (rs.next()) {
        session.setAttribute("user", userid); // the username will be stored in the session
        out.println("welcome " + userid);
        out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("successemp.jsp");
    } else {
        out.println("Invalid password <a href='index.jsp'>try again</a>");
    }
%>