<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="t" uri="http://java.sun.com/jsp/jstl/core"%>
    
 <html>
<head>
<title>Trip Details</title>
</head>
<body>
    <table>
        <t:forEach items="${list}" var="record">
            <tr>
                <td>${record.Trip_id }</td>
                <td>${record.Trip_source }</td>
                <td>${record.Trip_des }</td>
                <td>${record.Trip_distance }</td>
                <td>${record.Trip_duration }</td>
                <td>${record.End_userid }</td>
            </tr>
        </t:forEach>
    </table>
    </body>
    </html>