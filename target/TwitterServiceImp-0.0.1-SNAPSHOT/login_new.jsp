<!DOCTYPE html>
<html lang="en">
<head>
  <title>Smart Cab</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="css/signup.css">
  
</head>
<body background="${pageContext.request.contextPath}/images/new-york-city-usa-taxi-cars.jpg" >

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
     
      <h4 class="navbar-brand" >SmarTaxi</h4>
	  
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      
      <ul class="nav navbar-nav navbar-right">
	  
	  
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
     
      <form action="Login" method="post" class="navbar-form navbar-right">
	 
                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                            <input id="email" type="email" class="form-control" name="Username" value="" placeholder="Email Address">                                        
                        </div>

                        <div class="input-group">
                            <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                            <input id="password" type="password" class="form-control" name="Password" value="" placeholder="Password">   
                  </div>

                        <button type="submit" class="btn btn-primary">Login</button>
                        
                   </form>
     
    </div>
      </ul>
    </div>
  </div>
</nav>


  
<div>
<div class="container" >
    <div class="col-md-12" >
        <div id="logbox" class="pull-right" >
            <form action="SignUp" method="post">
                <h1>Create an Account</h1>
                
                <input name="FirstName" type="text" placeholder="Enter FirstName" required="required" class="input pass"/>
                <input name="LastName" type="text" placeholder="Enter LastName" required="required" class="input pass"/>
                <input name="Phone" type="text" placeholder="Enter Phone No" required="required" class="input pass"/>
                <input name="Address" type="text" placeholder="Enter Address" required="required" class="input pass"/>
                <input name="City" type="text" placeholder="Enter City" required="required" class="input pass"/>
                <input name="State" type="text" placeholder="Enter State" required="required" class="input pass"/>
                <input name="ZIP" type="text" placeholder="Enter ZIP" required="required" class="input pass"/>
            
				<input name="UserName" type="email" placeholder="Email address" class="input pass"/>
                <input name="Password" type="password" placeholder="Choose a password" required="required" class="input pass"/>
                
                
                <!-- <label for="UserType">User Role</label>  --> 
    <select class="input pass" name="UserType" id="UserType">
      <option>admin</option>
      <option>client</option>
      <option>enduser</option>
    </select>
                
                <input type="submit" value="Sign me up!" class="inputButton"/>

            </form>
        </div>
    </div>
    <!--col-md-6-->


</div>
</div>

</body>
</html>