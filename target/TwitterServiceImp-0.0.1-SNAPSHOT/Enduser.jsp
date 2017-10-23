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
    
    <script src='https://api.tiles.mapbox.com/mapbox-gl-js/v0.28.0/mapbox-gl.js'></script>
    <link href='https://api.tiles.mapbox.com/mapbox-gl-js/v0.28.0/mapbox-gl.css' rel='stylesheet' />
	<script src='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v3.0.2/mapbox-gl-directions.js'></script>
	<link rel='stylesheet' href='https://api.mapbox.com/mapbox-gl-js/plugins/mapbox-gl-directions/v3.0.2/mapbox-gl-directions.css' type='text/css' />
    <style>
        body { margin:0; padding:0; }
        
        #map { position:absolute; top:0; bottom:0; width:100%; }
        
        #fly {
        display: block;
        position: relative;
        margin: 0px auto;
        width: 25%;
        height: 40px;
        padding: 10px;
        border: none;
        border-radius: 3px;
        font-size: 14px;
        text-align: center;
        color: #fff;
        background: #ee8a65;
    }
    </style>

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
                <a class="navbar-brand" href="#">SmarTaxi</a>
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
                            <a class="active" href="#"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                       	<li>
                            <a href="billingEndUser.jsp"><i class="fa fa-table fa-fw"></i>Billing and Trip History</a>
                        </li> 
                         <li>
                            <a href="DriverSafetyScore.jsp"><i class="fa fa-table fa-fw"></i>Driver Safety Score</a>
                        </li>
                        
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
        
        <div id="page-wrapper">
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default" style="margin-top:2%">
                        <div class="panel-heading">
                             Taxi Service
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="width:950px;height:515px" >
                            
                           <div id='map' style="width:920px;height:500px;margin-top:7%" ></div>
                           <br/>
							<button id='fly'>Find a Cab</button>
                          
                        </div>
                        <!-- /.panel-body ------------------------------------------->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row ------------------------------------------------------------------------------------------------------------------->
			
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
    
    <script>
mapboxgl.accessToken = 'pk.eyJ1IjoicHJhdmVlbmVsMTI0OTAiLCJhIjoiY2l2aGt0MmY1MDE3cTJ0bzZhejZ0dDQ4byJ9.xSXtQYoeeoDsBAWxoNjJNw';
var map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v9',
    center: [-74.50, 40],
    zoom: 9
});

var directions = new MapboxDirections({
  accessToken: mapboxgl.accessToken,
  unit: 'metric',
  profile: 'driving'
});
// add to your mapboxgl map
map.addControl(directions);

$('.mapbox-directions-profile').remove();

document.getElementById('fly').addEventListener('click', function () {

	var origin= directions.getOrigin();
	var des = directions.getDestination();
	
	var srcLong = origin.geometry.coordinates[0];
	var srcLat = origin.geometry.coordinates[1];
	var destLong = des.geometry.coordinates[0];
	var destLat = des.geometry.coordinates[1];
	
	/* directions.addWaypoint(0,[-121.908412,37.335848 ]);
	directions.setOrigin([-121.8811,37.3352]);
	directions.setDestination([-121.916066,37.334974]); */
	
	var that = this;
	
	if($(that).html() == "Find a Cab" ){
		
		$.ajax({
		  	//context:this,
			url : 'ViewSensor',
			data : {
				srcLong : srcLong,
				srcLat : srcLat,
				destLong: destLong,
				destLat: destLat,
				state : "findCab"
			},
			success : function(cabCoordinates) {
				
				
				var cab = cabCoordinates.split(",");
				var cabLong = parseFloat(cab[1]);
				var cabLat = parseFloat(cab[0]);
				
				var sourceLong = directions.getOrigin().geometry.coordinates[0];
				var sourceLat = directions.getOrigin().geometry.coordinates[1];
				var desLong = directions.getDestination().geometry.coordinates[0];
				var desLat = directions.getDestination().geometry.coordinates[1];
				
				directions.addWaypoint(0,[sourceLong,sourceLat]);
				directions.setOrigin([cabLong,cabLat]);
				directions.setDestination([desLong,desLat]);
				
				$(that).html("Confirm Ride");
				
				/* if( $(that).closest("tr").find('#toggleStatus').text() == 'Activate'){
					$(that).closest("tr").find(".activate").html("Deactivate").removeClass( "btn-success activate" ).addClass( "btn-danger deactivate" );
					$(that).closest("tr").find(".sensorStatus").html("Active");
				}else{
					$(that).closest("tr").find(".deactivate").html("Activate").removeClass( "btn-danger deactivate" ).addClass( "btn-success activate" );
					$(that).closest("tr").find(".sensorStatus").html("Deactive");
				} */
				
			}
		});
		
		
	}else if ($(that).html() == "Confirm Ride" ){
		
		$.ajax({
		  	//context:this,
			url : 'ViewSensor',
			data : {
				srcLong : srcLong,
				srcLat : srcLat,
				destLong: destLong,
				destLat: destLat,
				state : "confirmRide"
			},
			success : function(cabCoordinates) {
				window.location.href = "book.jsp";
			}
		});
		
		
		
	}
	 
    
});
</script>

</body>

</html>