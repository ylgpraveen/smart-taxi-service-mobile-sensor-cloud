<!DOCTYPE html>
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
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Sensor Consumer Dashboard</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- iCheck -->
  <link rel="stylesheet" href="plugins/iCheck/flat/blue.css">
  <!-- Morris chart -->
  <link rel="stylesheet" href="plugins/morris/morris.css">
  
  <link href="assets/js/morris/morris-0.4.3.min.css" rel="stylesheet" />
  
  <!-- jvectormap -->
  <link rel="stylesheet" href="plugins/jvectormap/jquery-jvectormap-1.2.2.css">
  <!-- Date Picker -->
  <link rel="stylesheet" href="plugins/datepicker/datepicker3.css">
  <!-- Daterange picker -->
  <link rel="stylesheet" href="plugins/daterangepicker/daterangepicker.css">
  <!-- bootstrap wysihtml5 - text editor -->
  <link rel="stylesheet" href="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
  
  <title>AdminLTE 2 | Flot Charts</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
  <link rel="stylesheet" href="dist/css/skins/_all-skins.min.css">
  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
  <style>
table {
    border-collapse: collapse;
    width: 80%;
    align: center;
}
thead {color:primary;}
th, td {
    text-align: left;
    padding: 20px;
    border-bottom: 1px solid #ddd;
}
tr:hover{background-color:#E8C4CD}
tr:nth-child(even){background-color: #f2f2f2}
tr:nth-child(odd){background-color:  #eee}




th {
    background-color: #af4c6b;
    color: white;
}
</style>
</head>

  <!-- Content Wrapper. Contains page content -->

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Sensor Activity
      </h1>
      <ol class="breadcrumb">
        <li><a href="userDashBoard.jsp"><i class="fa fa-dashboard"></i> DashBoard</a></li>
        
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->

      <!-- Main row -->
      
           <!-- Donut chart -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-bar-chart-o"></i>

              <h3 class="box-title">Sensor Tracking</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
          
              </div>
            </div>
            <div class="box-body">
              <div id="donut-chart" style="height: 300px;"></div>
            </div>
            <!-- /.box-body-->
          </div>
           
           <table id="t01">
<caption style="font-size:200%;">Sensor Details</caption>
<tr style="background-color:black text-color:white">
<th>Sensor ID</th>
<th>Sensor Name</th>
<th>Sensor Description</th>
<th>Sensor Type</th>
<th>Status</th>
<th>Last Update</th>
</tr>


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

    
        <!-- right col -->
      <!-- /.row (main row) -->
   </section>
    <!-- /.content -->


  

<!-- ./wrapper -->

<!-- jQuery 2.2.3 -->
<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src="bootstrap/js/bootstrap.min.js"></script>
<!-- ChartJS 1.0.1 -->
<script src="plugins/chartjs/Chart.min.js"></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<!-- Sparkline -->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- jvectormap -->
<script src="plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- jQuery Knob Chart -->
<script src="plugins/knob/jquery.knob.js"></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src="plugins/daterangepicker/daterangepicker.js"></script>
<!-- datepicker -->
<script src="plugins/datepicker/bootstrap-datepicker.js"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<!-- Slimscroll -->
<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="plugins/fastclick/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="dist/js/app.min.js"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="dist/js/pages/dashboard.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="dist/js/demo.js"></script>
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

</html>


