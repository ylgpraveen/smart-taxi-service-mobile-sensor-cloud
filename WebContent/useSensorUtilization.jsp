<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
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

    <!-- Timeline CSS -->
    <link href="css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

  	<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
   	<script src="http://code.highcharts.com/highcharts.js"></script> 
    <!-- Custom Fonts -->
    

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

   

</head>

<body>
	<% 
								
								double[] data1 = {7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 
           									  26.5, 23.3, 18.3, 13.9, 9.6};
								double[] data2 = {-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 
                                             24.1, 20.1, 14.1, 8.6, 2.5};
								double[] data3 = {0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 
                                             17.9, 14.3, 9.0, 3.9, 1.0};
								double[] data4 = {3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 
   										16.6, 14.2, 10.3, 6.6, 4.8};
							
								HttpSession ses = request.getSession();
								 ArrayList<ArrayList<Double>> data = (ArrayList<ArrayList<Double>>)ses.getAttribute("data");
								 ArrayList<String> dates =  (ArrayList<String>)ses.getAttribute("dates");
								 System.out.println("dates "+dates.get(0) );
								 ArrayList<String> sensor_names = (ArrayList<String>)ses.getAttribute("sensornames");
								 String msg = (String)ses.getAttribute("msg");
								 
							%>

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
                                    <strong>Team SensorCloud</strong>
                                    <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                                </div>
                                <div>Get started ASAP...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>Team SensorCloud</strong>
                                    <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                                </div>
                                <div>Welcome to the world of Sensors...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>Team SensorCloud</strong>
                                    <span class="pull-right text-muted">
                                        <em>Today</em>
                                    </span>
                                </div>
                                <div>Greetings client.</div>
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
                                        <strong>Sensor-1</strong>
                                        <span class="pull-right text-muted">8&#8451;</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">8&#8451;  (success)</span>
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
                                        <strong>Sensor-2</strong>
                                        <span class="pull-right text-muted">12&#8451;</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">12&#8451;</span>
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
                                        <strong>Sensor-3</strong>
                                        <span class="pull-right text-muted">5&#8451;</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100" style="width: 25%">
                                            <span class="sr-only">5&#8451; (warning)</span>
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
                                        <strong>Sensor-4</strong>
                                        <span class="pull-right text-muted">13&#8451;</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="65" aria-valuemin="0" aria-valuemax="100" style="width: 65%">
                                            <span class="sr-only">13&#8451; (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            </li>
                        
                            
                        
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Sensors</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                        
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <li>
                            <a href="Logout"><i class="fa fa-user fa-fw"></i>LogOut</a>
                        </li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a class="active" href="Userdata"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                       <!--  <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Sensor Data<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                               <li>
                                    <a href="sensor.jsp">Sensor-1</a>
                                </li>
                                <li>
                                    <a href="sensor2.jsp">Sensor-2</a>
                                </li>
                                <li>
                                    <a href="sensor3.jsp">Sensor-3</a>
                                </li>
                                <li>
                                    <a href="sensor4.jsp">Sensor-4</a>
                                </li>
                                
                            </ul>
                            /.nav-second-level
                        </li> -->
                         <li>
                            <a href="Charts"><i class="fa fa-edit fa-fw"></i>Monitor Sensors</a>
                        </li>
                        <li>
                            <a href="SensorMap"><i class="fa fa-sitemap fa-fw"></i>Manage Sensors</a>
                        </li>
                        
                       <!--  <li>
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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Utilization of Sensors </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>	
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i>CPU Utilization</h3>
                            </div>
                            <div class="panel-body">
                            <div id="container" style="width:100%; height:400px;"></div>
                            	
                            <script>
                            var sanjose = [<%
                                           for (int i = 0; i < data1.length; i++) {
                                               out.print(data1[i]);
                                               if(i+1<data1.length){
                                                   out.print(",");
                                                   
                                               }
                                            }
                        	%>];
                            var santaclara = [<%
                                           for (int i = 0; i < data2.length; i++) {
                                               out.print("'"+data2[i]+"'");
                                               if(i+1<data2.length){
                                                   out.print(",");
                                                   
                                               }
                                            }
                        	%>];
                            var sanfran = [<%
                                           for (int i = 0; i < data3.length; i++) {
                                               out.print(data3[i]);
                                               if(i+1<data3.length){
                                                   out.print(",");
                                                   
                                               }
                                            }
                        	%>];
                            var losang = [<%
                                           for (int i = 0; i < data4.length; i++) {
                                               out.print(data4[i]);
                                               if(i+1<data4.length){
                                                   out.print(",");
                                                   
                                               }
                                            }
                        	%>];
                            
                            $('#container').highcharts({
                            	chart: {
                            	    type: 'line'
                            	},
                                title: {
                                	text: 'CPU Utilizatin'
                                },
                                subtitle: {
                                		text: 'CPU Utilization'
                                		},
                                xAxis: {
                                	title: { 
                                		text: 'Time'},
                                	categories: [<%
                                                 for (int i = 0; i < dates.size(); i++) {
                                                     out.print("'"+dates.get(i)+"'");
                                                     if(i+1<dates.size()){
                                                         out.print(",");
                                                         
                                                     }
                                                  }
                              	%>]
                                },
                                yAxis: {
                                	title: {
                                		text: 'Percentage (\xB0%)'
                                		},
                                		plotlines:[{
                                		      value: 0,
                                		      width: 1,
                                		      color: '#808080'
                                		   }]
                                },
                                tooltip: {
                                	valueSuffix: '\xB0%'
                            	},
                            	legend: {
                            			   layout: 'vertical',
                            			   align: 'right',
                            			   verticalAlign: 'middle',
                            			   borderWidth: 0
                            				},
                                series: []
                            });
                            
                      <%if(msg.equals("Sensor")){%>    
                     
                          <%for(int i =0; i< data.size(); i++){%>
                        	
                        	var a = new Array();
                        	
                        	<%for(int j =0; j< data.get(i).size(); j++){%>
                          
                        	a.push(<%=data.get(i).get(j)%>);
                        	
                        	<%}%>
                        	
                        	var chart  = $('#container').highcharts();
                            chart.addSeries({
                            	
                            	name:'<%=sensor_names.get(i)%>',
                            	data: a
                            	
                            })
                        	
                        	
						<%}%>
					<%}else{}%>
                            
                       
                            
                            
                            
                              </script> 
                            </div>
                        </div>
                    </div>
                
               <!--  <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            Sensor Data Display
                        </div>
                        /.panel-heading
                        <div class="panel-body">
                            <p>The line chart shows the sensing data for Sensor-1 placed in San Jose over 12 hours.</p>
                            </div>
                        /.panel-body
                    </div>
                    /.panel
                </div> -->
                <!-- /.col-lg-6 -->
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
