<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

    <%
    String name = "";
    String rev;
    String tmp ="[";
    String tmp1 ="[";
    String tmp2 ="[";
    String tmp3 ="[";
    int daily_trip_count = 0;
    int daily_trip_cost = 0;
    String q = request.getParameter("q");
    try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sensordb", "root", "root");
         Statement smt = con.createStatement(); //Create Statement to interact
    
         // Logic belongs to Bar Chart starts here
         ResultSet r = smt.executeQuery("select * from daily_revenue");
         while (r.next()) {
           name = r.getString("Day");
           rev = r.getString("Revenue");
           //System.out.println(name + "," + rev);
           tmp = tmp + "[\"" + name + "\"," + rev + "],"; 
         }
         tmp=tmp+"]";
    
      // Logic belongs to Bar Chart starts here
      //String a;
         ResultSet s = smt.executeQuery("select * from no_of_trips");
         while (s.next()) {
           name = s.getString("Day");
           rev = s.getString("Trips");
           //System.out.println(name + "," + rev);
           tmp1 = tmp1 + "[\"" + name + "\"," + rev + "],"; 
         }
         tmp1=tmp1+"]";
         
    
         
         ResultSet trip_stat = smt.executeQuery("select * from trip_details");
         while (trip_stat.next()) {
             daily_trip_count = daily_trip_count + 1;
             daily_trip_cost  = daily_trip_cost + (int)(trip_stat.getInt("cost"));
         }

    
    
         con.close();
    } catch (Exception e) {
         e.printStackTrace();
    }
 %>

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

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">

    <!-- iCheck -->
    <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
   
    <!-- jvectormap -->
    <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <!-- Date Picker -->
    <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
    <!-- Daterange picker -->
    <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker-bs3.css">
    <!-- bootstrap wysihtml5 - text editor -->
    <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
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
                <a class="navbar-brand" href="#">Smart Taxi Service Provider</a>
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
                            <a href="Charts"><i class="fa fa-table fa-fw"></i>Service Monitoring</a>
                        </li>
                      
                        <li> 
                            <a href="billingAdmin.jsp"><i class="fa fa-table fa-fw"></i> Billing</a>
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
                    <h1 class="page-header">Dashboard</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-9">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-taxi fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><%=daily_trip_count%></div>
                                    <div>Trips today</div>
                                </div>
                            </div>
                        </div>
                        <a href="trip_details_new.jsp">
                            <div class="panel-footer">
                                <span href="trip_details_new.jsp" class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-9">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                              <div class="col-xs-3">
                                 <i class="fa fa-usd fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge">$<%=daily_trip_cost%></div>
                                    <div>Daily Revenue</div>
                                </div>
                            </div>
                        </div>
                        <a href="daily_revenue_graph_new.jsp">
                            <div class="panel-footer">
                                <span href="daily_revenue_graph_new.jsp" class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-9">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                               <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div><h3>Driving Quality Analysis</h3></div>
                                </div>
                            </div>
                        </div>
                        <a href="DriverSafetyScore_Taxi.jsp">
                            <div class="panel-footer">
                                <span href="DriverSafetyScore_Taxi.jsp" class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>

            </div>
            
           </br>
          </br>
            
         <!-- LINE CHART 1--> 
          <!-- solid sales graph -->
          <div class="box box-solid bg-teal-gradient">
            <div class="box-header">
        

              <h3 "class="box-title">Number of Trips (last 7 days)</h3>

              <div class="box-tools pull-right">
              
               
              </div>
            </div>
            <div class="box-body border-radius-none">
              <div class="chart" id="line-chart" style="height: 250px;"></div>
            </div>
            <!-- /.box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
          
          </br>
          </br>
          
                   <!-- LINE CHART 2--> 
          <!-- solid sales graph -->
          <div class="box box-solid bg-red-gradient">
            <div class="box-header">
           

              <h3 "class="box-title">Revenue (last 7 days)</h3>

              <div class="box-tools pull-right">
             
              </div>
            </div>
            <div class="box-body border-radius-none">
              <div class="chart" id="line-chart2" style="height: 250px;"></div>
            </div>
            <!-- /.box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
          
            
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
     <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>


    <!-- Morris Charts JavaScript -->
    <script src="bower_components/raphael/raphael-min.js"></script>



    
    <!-- FLOT CHARTS -->
<script src="https://cdn.jsdelivr.net/jquery.flot/0.8.3/jquery.flot.min.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="plugins/flot/jquery.flot.resize.min.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="plugins/flot/jquery.flot.pie.min.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="plugins/flot/jquery.flot.categories.min.js"></script>
 
 <script>
$(document).ready(function () {

    
     
    /*
     * LINE CHART
     * ----------
     */
    //LINE randomly generated data

    var sin = [], cos = [];
    /*for (var i = 0; i < 14; i += 0.5) {
      sin.push([i, Math.sin(i)]);
      cos.push([i, Math.cos(i)]);
    }*/
    var active_taxi_sum_7_days = 0;
    for (var i = 0; i < 7; i += 1) {
    	var active_taxi =  Math.floor((Math.random() * 30) + 70);
    	active_taxi_sum_7_days = active_taxi_sum_7_days + active_taxi;
    	var inactive_taxi = 100 - active_taxi;
        sin.push([i,active_taxi]);
        cos.push([i,inactive_taxi]);
      }
    sin.push([7,60]);
    active_taxi_sum_7_days = active_taxi_sum_7_days + 60;
    cos.push([7,40]);
    
    
    var line_data1 = {
      data: <%=tmp1%>,
      color: "#3c55bc"
    };
    $.plot("#line-chart", [line_data1], {
      grid: {
        hoverable: true,
        borderColor: "#f3f3f3",
        borderWidth: 1,
        tickColor: "#f3f3f3"
      },
      series: {
        shadowSize: 0,
        lines: {
          show: true
        },
        points: {
          show: true
        }
      },
      lines: {
        fill: false,
        color: ["#b30047", "#b30047"]
      },
      yaxis: {
        show: true,
        axisLabel: "Day",
      },
      xaxis: {
    	mode: "categories",
    	show: true,
        axisLabel: "Number of Trips per day",
        tickSize: 1
      }
    });
    //Initialize tooltip on hover
    $('<div class="tooltip-inner" id="line-chart-tooltip"></div>').css({
      position: "absolute",
      display: "none",
      opacity: 0.8
    }).appendTo("body");
    $("#line-chart").bind("plothover", function (event, pos, item) {

      if (item) {
        var x = item.datapoint[0];
        var y = item.datapoint[1];

        $("#line-chart-tooltip").html("Trips on " + item.series.xaxis.ticks[x].label + " = " + y)
            .css({top: item.pageY + 5, left: item.pageX + 5})
            .fadeIn(200);
      } else {
        $("#line-chart-tooltip").hide();
      }

    });
    /* END LINE CHART */

    /* Line Chart - 2 */

    var line_data2 = {
      data: <%=tmp%>,
      color: "#00c0ef"
    };
    $.plot("#line-chart2", [line_data2], {
      grid: {
        hoverable: true,
        borderColor: "#f3f3f3",
        borderWidth: 1,
        tickColor: "#f3f3f3"
      },
      series: {
        shadowSize: 0,
        lines: {
          show: true
        },
        points: {
          show: true
        }
      },
      lines: {
        fill: false,
        color: ["#b30047", "#b30047"]
      },
      yaxis: {
        show: true,
        axisLabel: "Day",
      },
      xaxis: {
    	mode: "categories",
    	show: true,
        axisLabel: "Number of Trips per day",
        tickSize: 1
      }
    });
    //Initialize tooltip on hover
    $('<div class="tooltip-inner" id="line-chart2-tooltip"></div>').css({
      position: "absolute",
      display: "none",
      opacity: 0.8
    }).appendTo("body");
    $("#line-chart2").bind("plothover", function (event, pos, item) {

      if (item) {
        var x = item.datapoint[0];
        var y = item.datapoint[1];

        $("#line-chart2-tooltip").html("Revenue " + item.series.xaxis.ticks[x].label + " = $" + y)
            .css({top: item.pageY + 5, left: item.pageX + 5})
            .fadeIn(200);
      } else {
        $("#line-chart2-tooltip").hide();
      }

    });
    /* END LINE CHART */
    /*End of Line Chart 2 */

    
  });

  /*
   * Custom Label formatter
   * ----------------------
   */
   var previousPoint = null, previousLabel = null;
   
   $.fn.UseTooltip = function () {
       $(this).bind("plothover", function (event, pos, item) {
           if (item) {
               if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
                   previousPoint = item.dataIndex;
                   previousLabel = item.series.label;
                   $("#tooltip").remove();

                   var x = item.datapoint[0];
                   var y = item.datapoint[1];

                   var color = item.series.color;

                   //console.log(item.series.xaxis.ticks[x].label);                

                   showTooltip(item.pageX,
                   item.pageY,
                   color,
                   "<strong>" + item.series.xaxis.ticks[x].label + "</strong><br>" + "<strong>: $" + y + "</strong>");
               }
           } else {
               $("#tooltip").remove();
               previousPoint = null;
           }
       });
   };

   function showTooltip(x, y, color, contents) {
       $('<div id="tooltip">' + contents + '</div>').css({
           position: 'absolute',
           display: 'none',
           top: y - 1,
           left: x - 1,
           border: '2px solid ' + color,
           padding: '3px',
           'font-size': '14px',
           'border-radius': '7px',
           'background-color': '#fff',
           'font-family': 'Verdana, Arial, Helvetica, Tahoma, sans-serif',
           opacity: 0.9
       }).appendTo("body").fadeIn(200);
   }
   
  function labelFormatter(label, series) {
    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
        + label
        + "<br>"
        + Math.round(series.percent) + "%</div>";
  }
</script>
 

</body>

</html>