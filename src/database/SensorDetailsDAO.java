package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import VO.ADVO;
import VO.SensorDetailsVO;

public class SensorDetailsDAO {
	public List<SensorDetailsVO> display(){
		List<SensorDetailsVO> ls = new ArrayList<SensorDetailsVO>();
		try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * from sensordb.sensor_details");
				while(rs.next()){
					SensorDetailsVO sdvo = new SensorDetailsVO();
					sdvo.setSensor_id(rs.getInt("sensor_id"));
					sdvo.setSensor_name(rs.getString("sensor_name"));;
					sdvo.setSensor_desc(rs.getString("sensor_desc"));
					sdvo.setSensor_type(rs.getString("sensor_type"));
					sdvo.setSensor_cluster(rs.getInt("sensor_cluster"));
					sdvo.setSensor_status(rs.getString("sensor_status"));
					sdvo.setZipcode(rs.getInt("zipcode"));
					sdvo.setAddress1(rs.getString("address1"));
					sdvo.setAddress2(rs.getString("address2"));
					sdvo.setCity(rs.getString("city"));
					sdvo.setCountry(rs.getString("country"));
					sdvo.setState(rs.getString("state"));
					sdvo.setLatitude(rs.getDouble("latitude"));
					sdvo.setLongitude(rs.getDouble("longitude"));
					ls.add(sdvo);
				}
		}
		catch(Exception e){
				e.printStackTrace();
		}
		return ls;		
	}
	
	public void toggleSensorStatus(int index, String action){
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
			Statement st = con.createStatement();
			String sql = "UPDATE sensordb.sensor_details SET sensor_status ='"+action+"' WHERE sensor_id="+index;
			if(action.equals("Deregister")){
				sql = "DELETE from sensordb.sensor_details WHERE sensor_id="+index;
			}
			st.executeUpdate(sql);
			//ResultSet rs = st.executeQuery("SELECT * from sensordb.sensor_details");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException se){
			se.printStackTrace();
		}
		
	}
}
