package database;

import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import VO.BillingVO;

public class BillingsDAO {
	private static final int SECOND = 1000;
	private static final int MINUTE = 60 * SECOND;
	private static final int HOUR = 60 * MINUTE;
	private static final int DAY = 24 * HOUR;
	public List<BillingVO> display(){
		DecimalFormat df = new DecimalFormat("#.##");
		df.setRoundingMode(RoundingMode.CEILING);
		List<BillingVO> ls = new ArrayList<BillingVO>();
		try{
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","password");
				Statement st = con.createStatement();
				ResultSet rs = st.executeQuery("SELECT * from sensordb.sensor_master");
				while(rs.next()){
					BillingVO bvo = new BillingVO();
					bvo.setSensor_id(rs.getString("sensor_name"));
					System.out.println(rs.getString("sensor_id"));
					
					Date dt;
					dt=rs.getTimestamp("creation_date");
					long mls=dt.getTime();
					//System.out.println(mls);
					long millis = System.currentTimeMillis();
					long diff = millis - mls ;
//					long ms = 10304004543l;
					long diff1=diff;
					StringBuffer text = new StringBuffer("");
					if (diff1 > DAY) {
					  text.append(diff1 / DAY).append(" days ");
					  diff1 %= DAY;
					}
					if (diff1 > HOUR) {
					  text.append(diff1 / HOUR).append(" hours ");
					  diff1 %= HOUR;
					}
					if (diff1 > MINUTE) {
					  text.append(diff1 / MINUTE).append(" minutes ");
					  diff1 %= MINUTE;
					}
					if (diff1 > SECOND) {
					  text.append(diff1 / SECOND).append(" seconds ");
					  diff1 %= SECOND;
					}
					text.append(diff1 + " ms");
					bvo.setUp_time(text.toString());
					System.out.println(text.toString());
					System.out.println(diff);
					
					double price = diff * 0.005;
//					bvo.setCost(df.format(price));
					bvo.setCost(df.format(price));
					bvo.setUser_id(rs.getString("user_id"));
					System.out.println(price);
					
					ls.add(bvo);
				}
		}
		catch(Exception e){
				e.printStackTrace();
		}
		return ls;		
	}
}
