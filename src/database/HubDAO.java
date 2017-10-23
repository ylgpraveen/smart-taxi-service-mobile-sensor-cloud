package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import VO.HDVO;

public class HubDAO {
	public List<HDVO> display(int hub_id){
		List<HDVO> ls = new ArrayList<HDVO>();
		try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * from sensordb.sensor_master where hub_id="+hub_id+"");
				while(rs.next()){
					HDVO hdvo = new HDVO();
					hdvo.setSensor_tag_value(rs.getString("sensor_tag_value"));
					System.out.println(rs.getString("sensor_tag_value"));
					hdvo.setUser_id(rs.getString("user_id"));
					System.out.println(rs.getString("user_id"));
					hdvo.setSensor_status(rs.getString("sensor_status"));
					System.out.println(rs.getString("sensor_status"));
					hdvo.setLatitude(rs.getString("latitude"));
					System.out.println(rs.getString("latitude"));
					hdvo.setLongitude(rs.getString("longitude"));
					System.out.println(rs.getString("longitude"));
					hdvo.setDate(rs.getTimestamp("creation_date").toString());
					System.out.println(rs.getDate("creation_date"));
					ls.add(hdvo);
				}
		}
		catch(Exception e){
				e.printStackTrace();
		}
		return ls;		
	}
}
