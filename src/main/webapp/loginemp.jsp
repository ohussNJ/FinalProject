<!DOCTYPE html>
<html>
   <head>
      <title>Customer Rep Login Form</title>
</head>
   <body>
     <form action="checkEmpLoginDetails.jsp" method="POST">
       Username: <input type="text" name="username"/> <br/>
       Password: <input type="password" name="password"/> <br/>
       <input type="submit" value="Submit"/>
     </form>
  <br>
    <p>New User? Sign up below!</p>
    <form action="updateEmpRegister.jsp" method="POST">
    First Name: <input type="text" name="first_name"/> <br/>
    Last Name: <input type="text" name="last_name"/> <br/>
    SSN: <input type="number" name="ssn"/> <br/>
    Username: <input type="text" name="username"/> <br/>
    Password:<input type="password" name="password"/> <br/>
    <input type="submit" value="Submit"/>
    </form>
  <br/>
  </body>
</html>