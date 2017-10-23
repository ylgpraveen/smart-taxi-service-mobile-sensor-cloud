package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import VO.ADVO;
import VO.UsersTableVO;



public class UsersTable {
	/*public List<UsersTableVO> display(){
		List<UsersTableVO> ls = new ArrayList<UsersTableVO>();
		try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT u.user_id,count(s.sensor_id) as NUMBER_SENSORS,u.user_email,u.user_fname,u.user_lname,u.user_status FROM sensordb.user_master u join sensordb.sensor_master s on (s.user_id=u.user_id) group by user_id;");
				while(rs.next()){
					UsersTableVO vo = new UsersTableVO();
					
					vo.setUser_fname(rs.getString("user_fname"));
					System.out.println(rs.getString("user_fname"));
					
					vo.setUser_lname(rs.getString("user_lname"));
					System.out.println(rs.getString("user_lname"));
					
					vo.setUser_email(rs.getString("user_email"));
					System.out.println(rs.getString("user_email"));
//					vo.setCd(rs.getString("creation_date"));
					
					
					vo.setStatus(rs.getString("user_status"));
					System.out.println(rs.getString("user_status"));
					
					vo.setNUMBER_SENSOR(rs.getInt("NUMBER_SENSORS"));
					System.out.println(rs.getString("NUMBER_SENSORS"));
					ls.add(vo);
				}
		}
		catch(Exception e){
				e.printStackTrace();
		}
		return ls;		
	}*/
	public UsersTableVO display(int userid){
		UsersTableVO vo = new UsersTableVO();
		
		try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
				Statement st = con.createStatement();
				//ResultSet rs = st.executeQuery("SELECT u.user_id,count(s.sensor_id) as NUMBER_SENSORS,u.user_email,u.user_fname,u.user_lname,u.user_status FROM sensordb.user_master u join sensordb.sensor_master s on (s.user_id=u.user_id) group by user_id;");
				
				String sql = "SELECT * FROM sensordb.user_master where user_id="+userid+"";
				
				ResultSet rs = st.executeQuery(sql);
				
				while(rs.next()){
					
					vo.setUser_fname(rs.getString("user_fname"));
					System.out.println(rs.getString("user_fname"));
					
					vo.setUser_lname(rs.getString("user_lname"));
					System.out.println(rs.getString("user_lname"));
					
					vo.setUser_email(rs.getString("user_email"));
					System.out.println(rs.getString("user_email"));
//					vo.setCd(rs.getString("creation_date"));
					
					
					vo.setStatus(rs.getString("user_status"));
					System.out.println(rs.getString("user_status"));
					
					vo.setUser_type(rs.getString("user_type"));
					System.out.println(rs.getString("NUMBER_SENSORS"));
				}
					
					
					
		}
		catch(Exception e){
				e.printStackTrace();
		}
		return vo;		
	}
	
	
}
