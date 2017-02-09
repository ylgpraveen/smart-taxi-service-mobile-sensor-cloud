<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sensor Cloud</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
    <link href="bower_components/switchery/switchery.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Mobile Sensor Cloud Admin</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="Logout"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a href="Userdata"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="Charts"><i class="fa fa-edit fa-fw"></i>Monitor Sensors</a>
                        </li>
                        
                        <li>
                            <a href="SensorMap"><i class="fa fa-sitemap fa-fw"></i>Manage Sensors</a>
                        </li>   
                        <!-- <li>
                            <a href="Charts"><i class="fa fa-bar-chart-o fa-fw"></i>Temperature Data</a>
                        </li> -->
                         <li>
                            <a href="Billing"><i class="fa fa-table fa-fw"></i> Billing</a>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
           <!--  <div class="row"> --> 
                <div class="row page-header" style="margin-top:0%">
					<div class="pull-left">
                	<h1>Add Virtual Sensor</h1>
					</div>
					<div class="pull-right">
					<form name="locationname">
                    <input type="submit" style="float:right;margin-top:13%" class="btn btn-primary btn-md" Value="Back to Monitor Sensors" onclick="document.forms[0].action = 'Charts'; return true;"></input>
                    </form>
					</div>
                </div>
                    
            
            <!-- /.row -->
	<div class="col-md-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_content">
                    <br />
                    <form action="CreateSensor" method="post" class="form-horizontal form-label-left">

                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sensor Name</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" id="sensorName" name="sensorName" placeholder="Sensor Name" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Sensor Description</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" class="form-control" id="sensorDesc" name="sensorDesc" placeholder="Sensor Description" required>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Sensor Type</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select id="sensorType" name="sensorType" class="form-control" multiple>
                            <option value="location sensor">location sensor</option>
                            <option value="speed sensor">speed sensor</option>
                            <option value="radar sensor">radar sensor</option>
                          </select>
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Select Virtual Sensor</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select id="sensorCluster" name="sensorCluster" class="form-control">
                            <option value="101" >383 Stockton Avenue, SJ, CA</option>
                            <option value="102">367 Stockton Avenue, SJ, CA</option>
                            <option value="103">Mineta Airport, SJ, CA</option>
                            <option value="104">San Jose Diridon, SJ, CA</option>
                            <option value="105">Madras Groceries Sunnyvale</option>
                          </select>
                        </div>
                      </div>
					  <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >Latitude</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="latitude" name="latitude" class="form-control" placeholder="Latitude">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >Longitude</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="longitude" name="longitude" class="form-control" placeholder="Longitude">
                        </div>
                      </div>
					  <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >Zip Code</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="ZipCode">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >Address Line1</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="addressLine1" name="addressLine1" class="form-control" placeholder="Address Line1">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >Address Line2</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="addressLine2" name="addressLine2" class="form-control" placeholder="Address Line2">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >City</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="city" name="city" class="form-control" placeholder="City">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >State</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="state" name="state" class="form-control" placeholder="State">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" required >Country</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <input type="text" id="country" name="country" class="form-control" placeholder="Country">
                        </div>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12" >Sensor Status</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <select id="status" name="status" class="form-control">
                            <option>Active</option>
                            <option>Deactive</option>
                          </select>
                        </div>
                      </div>
                      

                      <div class="ln_solid"></div>
                      <div class="form-group">
                        <div class="col-md-9 col-sm-9 col-xs-12 col-md-offset-3">
                          <button type="submit" class="btn btn-primary">Reset</button>
                          <button type="submit" class="btn btn-success">Submit</button>
                        </div>
                      </div>

                    </form>
                  </div>
                </div>
              </div>            
            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
     <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="bower_components/raphael/raphael-min.js"></script>
    <script src="bower_components/morrisjs/morris.min.js"></script>
    <script src="js/morris-data.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

</body>

</html>