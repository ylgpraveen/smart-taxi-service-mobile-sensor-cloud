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
                       <!--  <li>
                            <a href="${pageContext.request.contextPath}/SensorMap"><i class="fa fa-bar-chart-o fa-fw"></i> Sensor on Map<span class="fa arrow"></span></a>
                            
                             
                        </li> -->
                        <li>
                            <a href="Charts"><i class="fa fa-edit fa-fw"></i>Monitor Sensors</a>
                        </li>
                         <!-- <li>
                            <a href="SensorMap"><i class="fa fa-sitemap fa-fw"></i>Sensors' Location</a>
                        </li> -->
                         
                        <li>
                            <a class="active" href="#"><i class="fa fa-sitemap fa-fw"></i>Manage Sensors</a>
                        </li>
                        
                       <!--  <li>
                            <a href="Charts"><i class="fa fa-bar-chart-o fa-fw"></i>Temperature Data</a>
                        </li> -->
                        
                         <li>
                            <a href="billingUser.jsp"><i class="fa fa-table fa-fw"></i> Billing</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Manage Sensors</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <!-- /.row -->
           <div class="row">
           <table class="table table-striped table-bordered table-hover">
           	<thead>
           		<tr>
           		<td>Sensor ID</td>
           		<td>Sensor Name</td>
           		<td>Sensor Type</td>
           		<td>Sensor Cluster</td>
           		<td>Sensor Status</td>
           		<td>Actions</td>
           		</tr>
           		</thead>
           		<t:forEach items="${sensor}"  var="tb">
           		<tr>
           		<td class="sensorId">${tb.sensor_id }</td>
           		<td>${tb.sensor_name }</td>
           		<td>${tb.sensor_type }</td>
           		<td>${tb.sensor_cluster }</td>
           		<td class="sensorStatus">${tb.sensor_status}</td>
           		<td>
           		<t:choose>
				    <t:when test="${tb.sensor_status =='Active'}">
				    
				    <button type="button" id="toggleStatus" class="btn btn-danger deactivate">Deactivate</button>
				    
				    </t:when>    
				    <t:otherwise>
				    <button type="button" id="toggleStatus" class="btn btn-success activate">Activate</button>
				         <!-- <button type="button" class="btn btn-success">Activate</button> -->
				    </t:otherwise>
				</t:choose>
				<button type="button" id="deregister" class="btn btn-info deregister">Deregister</button>
				</td>
           		</tr>
           		</t:forEach>
           		
           </table>
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
    <script type="text/javascript">
    
   
    $( ".activate,.deactivate" ).click(function(e) {
    	  var $item = $(this).closest("tr").find(".sensorId").text();
    	  var $action = $(this).closest("tr").find(".sensorStatus").text();
    	  if($action == "Active"){
    		 $action = "Deactive"; 
    	  }else{
    		 $action = "Active"; 
    	  }
    	  var that = this;
    	  $.ajax({
    		  	//context:this,
				url : 'userstable',
				data : {
					index : parseInt($item),
					action: $action
				},
				success : function(responseText) {
					if( $(that).closest("tr").find('#toggleStatus').text() == 'Activate'){
						$(that).closest("tr").find(".activate").html("Deactivate").removeClass( "btn-success activate" ).addClass( "btn-danger deactivate" );
						$(that).closest("tr").find(".sensorStatus").html("Active");
					}else{
						$(that).closest("tr").find(".deactivate").html("Activate").removeClass( "btn-danger deactivate" ).addClass( "btn-success activate" );
						$(that).closest("tr").find(".sensorStatus").html("Deactive");
					}
					
				}
			});
    	});
    
    $( ".deregister" ).click(function(e) {
  	  var $item = $(this).closest("tr").find(".sensorId").text();
  	  $.ajax({
  		  	context:this,
				url : 'userstable',
				data : {
					index : parseInt($item),
					action: "Deregister"
				},
				success : function(responseText) {
					$(this).closest("tr").remove();
				}
			});
  	});
    
    
    </script>

</body>

</html>