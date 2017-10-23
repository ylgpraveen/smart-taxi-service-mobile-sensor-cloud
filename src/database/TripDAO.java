package database;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.TDVO;

public class TripDAO{
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//public List<TDVO> display(){
				List<TDVO> list = new ArrayList<TDVO>();
				try{
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
					Statement st = con.createStatement();
					ResultSet rs = st.executeQuery("SELECT * FROM sensordb.trip_details");
while (rs.next()) {
    TDVO TripDetail = new TDVO();
    TripDetail.setTrip_id(rs.getInt("Trip_id"));
    TripDetail.setTrip_source(rs.getString("Trip_source"));
    TripDetail.setTrip_des(rs.getString("Trip_des"));
    TripDetail.setTrip_distance(rs.getString("Trip_distance"));
    TripDetail.setTrip_duration(rs.getInt("Trip_duration"));
    TripDetail.setTrip_duration(rs.getInt("End_userid"));

    list.add(TripDetail);
}
}
		catch(Exception e){
				e.printStackTrace();}

request.setAttribute("list",list);

RequestDispatcher rd= request.getRequestDispatcher("Tripdetails.jsp");
rd.forward(request, response);
				//return list;	
	}
	}

