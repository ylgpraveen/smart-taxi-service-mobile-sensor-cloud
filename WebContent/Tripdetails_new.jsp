<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<html>
<head>

<!-- Custom CSS -->
    <link href="css/sTripdetails1.css" rel="stylesheet">

</head></html>
<%
//String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "sensordb";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} 
  catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<h2 align="center"><font><strong>Trip History</strong></font></h2>
<table align="center" cellpadding="5" cellspacing="5" border="1">
<tr>

</tr>
<tr bgcolor="#A52A2A">
<td><b>Trip id</b></td>
<td><b>Source location</b></td>
<td><b>Destination</b></td>
<td><b>Total distance</b></td>
<td><b>Duration</b></td>
<td><b>End_userid</b></td>
</tr>
<%
try{ 
connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
statement=connection.createStatement();
String sql ="SELECT * FROM sensordb.trip_details";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#DEB887">

<td><%=resultSet.getString("Trip_id") %></td>
<td><%=resultSet.getString("Trip_source") %></td>
<td><%=resultSet.getString("Trip_des") %></td>
<td><%=resultSet.getString("Trip_distance") %></td>
<td><%=resultSet.getString("Trip_duration") %></td>
<td><%=resultSet.getString("userid") %></td>

</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>