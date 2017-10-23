<!DOCTYPE html>
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
         
    
         ResultSet t= smt.executeQuery("select * from expenses");
         while (t.next()) {
           name = t.getString("Day_of_month");
           rev = t.getString("expenses");
           //System.out.println(name + "," + rev);
           tmp2 = tmp2 + "[\"" + name + "\"," + rev + "],"; 
         }
         tmp2=tmp2+"]";
          
         
         ResultSet p= smt.executeQuery("select * from act_sensor");
         while (p.next()) {
           name = p.getString("Timestamp");
           rev = p.getString("Active_sensor");
           //System.out.println(name + "," + rev);
           tmp3 = tmp3 + "[\"" + name + "\"," + rev + "],"; 
         }
         tmp3=tmp3+"]";
         
         ResultSet trip_stat = smt.executeQuery("select * from trip_details");
         while (trip_stat.next()) {
             daily_trip_count = daily_trip_count + 1;
             daily_trip_cost  = daily_trip_cost + (int)(trip_stat.getFloat("cost"));
         }

    
    
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
        Revenue Data
      </h1>
      <ol class="breadcrumb">
        <li><a href="userDashBoard.jsp"><i class="fa fa-dashboard"></i> DashBoard</a></li>
        
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->

      <!-- Main row -->
      
               <table id="t01">
<caption style="font-size:200%;">Trip Revenue (today)</caption>
<tr style="background-color:black text-color:white">
<th>Trip ID</th>
<th>Distance (miles)</th>
<th>Cost (dollars)</th>
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
	String query="select * from trip_details";
	Connection conn=DriverManager.getConnection(url,username,password);
	Statement stmt=conn.createStatement();
	ResultSet rs=stmt.executeQuery(query);
	
	while(rs.next())
	{
		
    %> 
    <tr>
	<td><%=rs.getString("tripID") %></td>
    <td><%=(int)rs.getFloat("distance") %></td>
    <td><%=(int)rs.getFloat("cost") %></td>
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
  
  <p>     </p>
  <p>     </p>
  <p>     </p>
  <h3>     </h3>
 
 
                   <!-- LINE CHART 2--> 
          <!-- solid sales graph -->
          <div class="box box-solid bg-purple-gradient">
            <div class="box-header">
              <i class="fa fa-th"></i>

              <h3 "class="box-title">Revenue (last 7 days)</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn bg-primary btn-sm" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <div class="box-body border-radius-none">
              <div class="chart" id="line-chart2" style="height: 250px;"></div>
            </div>
            <!-- /.box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
 
           

    
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

	

    /* Line Chart - 2 */

    var line_data2 = {
      data: <%=tmp%>,
      color: "#ff33ef"
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

</html>


