<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
<%@ page import="java.util.*" %>
<title>Sensor Cloud</title>

 <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script src='https://api.mapbox.com/mapbox.js/v2.4.0/mapbox.js'></script>
	<link href='https://api.mapbox.com/mapbox.js/v2.4.0/mapbox.css' rel='stylesheet' />
    <script type="text/javascript" src="https://pubnub.github.io/eon/v/eon/1.0.0/eon.js"></script>
    <link type="text/css" rel="stylesheet" href="https://pubnub.github.io/eon/v/eon/1.0.0/eon.css"/>
	
    <style>
      body {
        margin: 0;
        padding: 0;
      }
      #map {
        position:absolute;
        top:0;
        bottom:0;
        width:100%;
      }
    </style>
	
<script
src="http://maps.googleapis.com/maps/api/js?key=AIzaSyDuiDw7TZPGDoAhZO_ghj1ygRzp52V-mcw">
</script>

<script>

                 
   <%
  		 ArrayList<String> names = (ArrayList<String>)request.getAttribute("names");
		 ArrayList<Double> lat = (ArrayList<Double>)request.getAttribute("lat");
		 ArrayList<Double> lon = (ArrayList<Double>)request.getAttribute("lon");
   		
   %>              
                 
 
	
                 function initialize() {

                   var myOptions = {
                     center: new google.maps.LatLng(37.33495, -121.88198),
                     zoom: 9,
                     mapTypeId: google.maps.MapTypeId.ROADMAP

                   };
                   var map = new google.maps.Map(document.getElementById("googleMap"),
                       myOptions);

                   setMarkers(map)

                 }



         function setMarkers(map){	

                     var marker

              <% for (int i = 0; i < names.size(); i++)
                {%>  

                var name = '<%=names.get(i)%>'
                var lat = <%=lat.get(i)%>
                var lon = <%=lon.get(i)%>
               

                latlngset = new google.maps.LatLng(lat, lon);

                 var marker = new google.maps.Marker({  
                         map: map, title: name , position: latlngset  
                       });
                       map.setCenter(marker.getPosition())


                       var content = "Sensor Name: " + name     

                 var infowindow = new google.maps.InfoWindow()

               google.maps.event.addListener(marker,'click', (function(marker,content,infowindow){ 
                       return function() {
                          infowindow.setContent(content);
                          infowindow.open(map,marker);
                       };
                   })(marker,content,infowindow)); 

                 <%}%>
         }




google.maps.event.addDomListener(window, 'load', initialize);

</script>
<script type="text/javascript">

function createsensor()
{
	
	document.locationname.submit();	
	
	
}

</script>


<!-- Divya end Google Script ----------------------------------------------------------------------------------------------------------------------->	
	


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
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
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
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">Flot Charts</a>
                                </li>
                                <li>
                                    <a href="morris.html">Morris.js Charts</a>
                                </li>
                            </ul>
                            /.nav-second-level
                        </li> -->
                        <li>
                            <a href="Charts"><i class="fa fa-edit fa-fw"></i>Montior Sensors</a>
                        </li>
                        <li>
                            <a class="active" href="SensorMap"><i class="fa fa-sitemap fa-fw"></i>Manage Sensors</a>
                        </li>
                        
                      <!--   <li>
                            <a href="Charts"><i class="fa fa-bar-chart-o fa-fw"></i>Temperature Data</a>
                        </li> -->
                       
                                
                         <li>
                            <a href="Billing"><i class="fa fa-table fa-fw"></i> Billing</a>
                        </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <!-- <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            /.nav-second-level
                        </li> -->
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

		
		
			<div id="page-wrapper">
				<div class="row">
                
					<div class="col-lg-12">
					
						 <h2 class="page-header">My Sensors</h2>
						
                
					</div>
				
				<!-- <div class="col-lg-2">
				<br>
                    <label style="padding-top:6px">Sensor Name</label>
						
                
				</div>
				
				<div class="col-lg-3">
				<br>
                    <input class="form-control" placeholder="Enter Sensor Name" id="sensorname" name="sensorname">
						
                
				</div>
				<div class="col-lg-5">
				<br>
                   
                
				</div> -->
				
				
                <!-- /.col-lg-12 -->
            </div>
		
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            My Sensors
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            
                           <div id='map'></div>
                          
                        </div>
                        <!-- /.panel-body ------------------------------------------->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row ------------------------------------------------------------------------------------------------------------------->
            
			<input type="hidden" id='lat' name="lat"/>
			<input type="hidden" id='lon' name="lon"/>
			
        </div>
	
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
     <!--   <script src="bower_components/jquery/dist/jquery.min.js"></script> -->
     
     <script src="https://cdn.pubnub.com/pubnub.min.js"></script>
	<script src='https://code.jquery.com/jquery-1.11.0.min.js'></script>

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

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
    <script>
      function getNonZeroRandomNumber(){
        var random = Math.floor(Math.random()*199) - 99;
        if(random==0) return getNonZeroRandomNumber();
        return random;
      }
    </script>
    <script>
	
	L.RotatedMarker = L.Marker.extend({
    options: { angle: 0 },
    _setPos: function(pos) {
      L.Marker.prototype._setPos.call(this, pos);
      if (L.DomUtil.TRANSFORM) {
        // use the CSS transform rule if available
        this._icon.style[L.DomUtil.TRANSFORM] += ' rotate(' + this.options.angle + 'deg)';
      } else if (L.Browser.ie) {
        // fallback for IE6, IE7, IE8
        var rad = this.options.angle * L.LatLng.DEG_TO_RAD,
        costheta = Math.cos(rad),
        sintheta = Math.sin(rad);
        this._icon.style.filter += ' progid:DXImageTransform.Microsoft.Matrix(sizingMethod=\'auto expand\', M11=' +
          costheta + ', M12=' + (-sintheta) + ', M21=' + sintheta + ', M22=' + costheta + ')';
      }
    }
  });
  
	  var jsonData;
      
      var pubnub = new PubNub({
        publishKey: 'demo',
        subscribeKey: 'demo'
      });

      var channel = 'pubnub-mapbox' + getNonZeroRandomNumber();

      var map = eon.map({
        pubnub: pubnub,
        id: 'map',
        mbToken: 'pk.eyJ1IjoiaWFuamVubmluZ3MiLCJhIjoiZExwb0p5WSJ9.XLi48h-NOyJOCJuu1-h-Jg',
        mbId: 'ianjennings.l896mh2e',
        channels: [channel],
        connect: connect,
        options: {
          zoomAnimation: true,
        },
		rotate: true,
		history:true,
		marker: function (latlng,data) {

	  var classname = "icon"+data[0];	
      var marker = new L.RotatedMarker(latlng, {
        icon: L.icon({
          iconUrl: 'http://i.imgur.com/2fmFQfN.png',
          iconSize: [9, 32],
		  className: classname
        })
      });
	  
	  var str= '<button id='+data[0]+" "+'class="trigger">Deactivate Sensor '+data[0]+'</button>';
	  
	  marker.bindPopup(str).addTo(map);

      //marker.bindPopup('Route ' + data.routeTag.toUpperCase());

      return marker;

    }
      });
	  
	  $('#map').on('click', '.trigger', function(e) {
		if(e.currentTarget && e.currentTarget.id){
		var index = ".icon"+parseInt(e.currentTarget.id);
		$(index).remove();
		$(".leaflet-popup-pane").children().remove();
		}
		});
	 
	 function connect() {

		
      jsonData=[{
"routes":[0,"Route0","active"],
"points":[{"latlng":[37.335848, -121.908412]},
		{"latlng":[37.33646, -121.908864]},
		{"latlng":[37.336773, -121.909575]},
		{"latlng":[37.337246, -121.909753]},
		{"latlng":[37.338005, -121.910908]},
		{"latlng":[37.338322, -121.911176]},
		{"latlng":[37.339489, -121.912422]},
		{"latlng":[37.340069, -121.913056]},
		{"latlng":[37.340564, -121.913509]},
		{"latlng":[37.3412, -121.914087]},
		{"latlng":[37.341652, -121.914739]},
		{"latlng":[37.342493, -121.915685]},
		{"latlng":[37.342008, -121.915043]},
		{"latlng":[37.341218, -121.914967]},
		{"latlng":[37.340635, -121.915541]},
		{"latlng":[37.340224, -121.91628]},
		{"latlng":[37.339675, -121.917004]},
		{"latlng":[37.338966, -121.918288]},
		{"latlng":[37.338864, -121.918377]},
		{"latlng":[37.337402, -121.918748]},
		{"latlng":[37.336411, -121.918288]},
		{"latlng":[37.336389, -121.91811]},
		{"latlng":[37.335333, -121.916286]},
		{"latlng":[37.334974, -121.916066]}]

},{
"routes":[1,"Route1","active"],
"points":[{"latlng":[37.340564, -121.913509]},
		{"latlng":[37.3412, -121.914087]},
		{"latlng":[37.341652, -121.914739]},
		{"latlng":[37.342493, -121.915685]},
		{"latlng":[37.342008, -121.915043]},
		{"latlng":[37.341218, -121.914967]},
		{"latlng":[37.340635, -121.915541]},
		{"latlng":[37.340224, -121.91628]},
		{"latlng":[37.339675, -121.917004]},
		{"latlng":[37.338966, -121.918288]},
		{"latlng":[37.338864, -121.918377]},
		{"latlng":[37.337402, -121.918748]},
		{"latlng":[37.336411, -121.918288]},
		{"latlng":[37.336389, -121.91811]},
		{"latlng":[37.335333, -121.916286]},
		{"latlng":[37.334974, -121.916066]}]

},{
"routes":[2,"Route2","active"],
"points":[{"latlng":[37.339675, -121.917004]},
		{"latlng":[37.338966, -121.918288]},
		{"latlng":[37.338864, -121.918377]},
		{"latlng":[37.337402, -121.918748]},
		{"latlng":[37.336411, -121.918288]},
		{"latlng":[37.336389, -121.91811]},
		{"latlng":[37.335333, -121.916286]},
		{"latlng":[37.334974, -121.916066]}]

}];

		var j=0;
		
		function go() {
			
		var new_points = JSON.parse(JSON.stringify(jsonData));
          for (var i = 0; i < new_points.length; i++) {
		  console.log("j: "+j);
		  var maxlen = new_points[i].points.length;
		  if(j< maxlen && new_points[i].routes[2] == "active"){
		  console.log("In here for "+j+" th time");
			new_points[i] = {
              data: new_points[i].routes,
              latlng: [
                new_points[i].points[j].latlng[0],
                new_points[i].points[j].latlng[1]
                      ]
				}
			}else{
			    new_points[i] = {
					data: new_points[i].routes,
					
					latlng: [
						new_points[i].points[maxlen-1].latlng[0],
						new_points[i].points[maxlen-1].latlng[1]
                      ]
				}
				
			var index = ".icon"+new_points[i].data[0];
			$(index).remove();
			$(".leaflet-popup-pane").children().remove();
			
			}
          }
		  
		  console.log("new points" + new_points);

          pubnub.publish({
            channel: channel,
            message: new_points
          });
		  
            if (j++ < 24) {
                setTimeout(go, 5000);
            }
        }
		
        go();
        

      };

    </script>



</body>
</html>