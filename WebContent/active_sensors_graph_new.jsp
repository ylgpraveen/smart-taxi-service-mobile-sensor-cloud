<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="java.util.Date" %>

    <%
    String name = "";
    String rev;
    String tmp ="[";
    String tmp1 ="[";
    String tmp2 ="[";
    String sensor_times ="[";
    String sensor_cost_data ="[";
    int active_sensor_count = 0;
    int inactive_sensor_count = 0;
    int service_sensor_count = 0;
    int total_sensor_count = 0;
    long total_revenue = 0;
    String act_status = "Active";
    String inact_status = "Inactive";
    String service_status = "Service";
    String q = request.getParameter("q");
    Date create_dt;
    Date last_update_dt;
    try {
         Class.forName("com.mysql.jdbc.Driver");
         Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/sensordb", "root", "root");
         Statement smt = con.createStatement(); //Create Statement to interact
    
          
         ResultSet sen_stat = smt.executeQuery("select * from sensor_details");
         while (sen_stat.next()) {
           name = sen_stat.getString("sensor_status");
           if(name.equals(act_status)) {
        	  active_sensor_count = active_sensor_count + 1; 
           }
           else if(name.equals(inact_status)) {
        	  inactive_sensor_count = inactive_sensor_count + 1; 
           }
           else if(name.equals(service_status)) {
        	  service_sensor_count = service_sensor_count + 1; 
           }
         }
         total_sensor_count = active_sensor_count + inactive_sensor_count + service_sensor_count;
         
	     

	     			
         ResultSet sen_times= smt.executeQuery("select * from sensor_details");
         while (sen_times.next()) {
           name = sen_times.getString("sensor_id");
    	   create_dt = sen_times.getTimestamp("creation_date");
    	   last_update_dt = sen_times.getTimestamp("lastUpdated");
    	   long secs = (last_update_dt.getTime() - create_dt.getTime()) / 1000;
    	   long hours = secs / 3600; 
    	   long days = hours/24;
    	   rev = Long.toString(days);
    	   
           sensor_times = sensor_times + "[\"" + "Sensor ID-" + name + "\"," + rev + "],"; 
         }
         sensor_times=sensor_times+"]";	
	     
         ResultSet sen_cost= smt.executeQuery("select * from sensor_details");
         while (sen_cost.next()) {
           name = sen_cost.getString("sensor_id");
    	   create_dt = sen_cost.getTimestamp("creation_date");
    	   last_update_dt = sen_cost.getTimestamp("lastUpdated");
    	   int  cost = sen_cost.getInt("cost");
    	   long secs = (last_update_dt.getTime() - create_dt.getTime()) / 1000;
    	   long hours = secs / 3600; 
    	   long per_sensor_cost = (hours/24) * cost;
    	   rev = Long.toString(per_sensor_cost);
    	   total_revenue = total_revenue + per_sensor_cost;
    	   sensor_cost_data = sensor_cost_data + "[\"" + "Sensor ID-" + name + "\"," + rev + "],"; 
         }
         sensor_cost_data=sensor_cost_data+"]";	     
    
    
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
                            <a href="SensorMap"><i class="fa fa-sitemap fa-fw"></i> Manage Sensors</a>
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
                    <h1 class="page-header">Active Sensor Details</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            
            <div id="container" style="min-width: 400; height: 200; margin: 0 auto"></div>

                       <!-- Donut chart -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-bar-chart-o"></i>

              <h3 class="box-title">Sensor Tracking</h3>

              <div class="box-tools pull-right">
               
              </div>
            </div>
            <div class="box-body">
              <div id="donut-chart" style="height: 340px;"></div>
            </div>
            <!-- /.box-body-->
          </div>
               
            <br />
            <br />
            <br />
                       <br />
            <!-- /.row -->
            <!-- /.row -->
           <div class="row">
           <table class="table table-striped table-bordered table-hover">
           	<thead>
           		<tr>
				<td>Sensor ID</td>
				<td>Sensor Name</td>
				<td>Sensor Description</td>
				<td>Sensor Type</td>
				<td>Status</td>
				<td>Last Update</td>
           		</tr>
           		</thead>
           		
					
					<%@ page import="java.sql.*" %>
					<%@ page import="javax.sql.*" %> 
					<%@ page import="java.util.*" %>
					
					<%
					
						try
						{
							Class.forName("com.mysql.jdbc.Driver");
						}
						catch(ClassNotFoundException ex)
						{
						
						}
					
						String url="jdbc:mysql://localhost/sensordb";
						String username="root";
						String password="root";
						String query="select * from sensor_details";
						Connection conn=DriverManager.getConnection(url,username,password);
						Statement stmt=conn.createStatement();
						ResultSet rs=stmt.executeQuery(query);
						
						while(rs.next())
						{
							
					    %> 
					    <tr>
						<td><%=rs.getString("sensor_id") %></td>
					    <td><%=rs.getString("sensor_name") %></td>
					    <td><%=rs.getString("sensor_desc") %></td>
					    <td><%=rs.getString("sensor_type") %></td>
					    <td><%=rs.getString("sensor_status") %></td>
					    <td><%=rs.getString("lastUpdated") %></td>
						</tr>     
					<%
						}
						
					%>
					    </table>
					<%
					
					    rs.close();
					    stmt.close();
					    conn.close();
					 %>
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
     * DONUT CHART
     * -----------
     */

    var donutData = [
      {label: "Active Sensors", data: <%=active_sensor_count%>, color: "#3c8dbc"},
      {label: "Idle sensors", data: <%=inactive_sensor_count%>, color: "#808080"}
    ];
    $.plot("#donut-chart", donutData, {
      series: {
        pie: {
          show: true,
          radius: 1,
          innerRadius: 0.5,
          label: {
            show: true,
            radius: 0.78,
            formatter: labelFormatter,
            threshold: 0.01
          }

        }
      },
      legend: {
        show: false
      }
    });
    /*
     * END DONUT CHART
     */


    
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