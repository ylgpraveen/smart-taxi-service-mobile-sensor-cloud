<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/login.css">
 <title>Login</title>
</head>
<body background="${pageContext.request.contextPath}/images/new-york-city-usa-taxi-cars.jpg">

 <div class = "container">
	<div class="wrapper">
		<form role="form" action="Login" method="post" class="form-signin">       
		    <h3 class="form-signin-heading">Log In</h3>
			  <hr class="colorgraph"><br>
			  
			  <input type="text" class="form-control" name="Username" placeholder="Username" required="" autofocus="" />
			  <input type="password" class="form-control" name="Password" placeholder="Password" required=""/>     		  
			 <br>
			  <button name="Submit" value="Login" type="Submit" >Login</button>
			  
			  
			 	
  							
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="login_new.jsp"> Register</a>   
			 
				
		</form>			
	</div>
</div>
</body>
</html>