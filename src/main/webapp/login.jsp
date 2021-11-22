<!DOCTYPE html>
<html>
   <head>
      <title>Customer Login Form</title>
</head>
   <body>
     <form action="checkLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password: <input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
  <br>
    <p>New User? Sign up below!</p>
    <form action="updateRegister.jsp" method="POST">
    First Name: <input type="text" name="first_name"/> <br/>
    Last Name: <input type="text" name="last_name"/> <br/>
    Username: <input type="text" name="username"/> <br/>
    Password:<input type="password" name="password"/> <br/>
    <input type="submit" value="Submit"/>
    </form>
  <br/>
  </body>
</html>