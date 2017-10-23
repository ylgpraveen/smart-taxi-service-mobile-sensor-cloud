package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import VO.ADVO;

public class AdminDAO {
	public List<ADVO> display(){
		List<ADVO> ls = new ArrayList<ADVO>();
		try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * from sensordb.hub_master");
				while(rs.next()){
					ADVO advo = new ADVO();
					advo.setHub_id(rs.getInt("hub_id"));
					System.out.println(rs.getInt("hub_id"));
					advo.setNo_of_server(rs.getInt("no_of_server"));
					System.out.println(rs.getInt("no_of_server"));
					advo.setHub_status(rs.getString("hub_status"));
					System.out.println(rs.getString("hub_status"));
					
					ls.add(advo);
				}
		}
		catch(Exception e){
				e.printStackTrace();
		}
		return ls;		
	}
}
