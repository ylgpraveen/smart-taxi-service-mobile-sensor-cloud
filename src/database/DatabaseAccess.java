package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.amazonaws.services.dynamodbv2.xspec.S;

import login.Auth;

public class DatabaseAccess {

	public void insert(String query){
		try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
		Statement st = con.createStatement();
		st.executeUpdate(query);
		
		st.close();
		con.close();
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}
	public Auth auth(String query, String password){
		Auth a = new Auth();
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
		
		while(rs.next()){
			String password1 = rs.getString("user_password");
			int id = rs.getInt("user_id");
			String type = rs.getString("user_type");
				a.setType(type);
				a.setId(id);
				a.setPassword(password1);
			
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return a;
	}
	
	
	public ArrayList<String> getlLatLong(String user_id, String sensor_id,String query)
	{
		ArrayList<String> latlong = new ArrayList<String>();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
		
		while(rs.next()){
			
			String lat = rs.getString("latitude");
			String lon = rs.getString("longitude");
			latlong.add(lat);
			latlong.add(lon);
			
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		
		return latlong;
		
	}
	
	
	public int getHubId(String query)
	{
		int hub_id = 0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			
			if(rs!=null)
			{
				while(rs.next()){
			
					hub_id= rs.getInt("hub_id");
			
				}
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return hub_id;
		
	}
	
	
	
	public int getNoodfSensor(String query)
	{
		int no_of_server=0;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			
			if(rs!=null)
			{
				while(rs.next()){
			
					no_of_server= rs.getInt("no_of_server");
			
				}
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return no_of_server;
	}
	
	
	
	public ArrayList<String> getSensorID(String query)
	{
		ArrayList<String> sensor_id = new ArrayList<String>();
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			
			if(rs!=null)
			{
				while(rs.next()){
			
					sensor_id.add(rs.getString("sensor_id"));
					
				}
			}
			else{
				return null;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return sensor_id;
	}
	
	
	
	public ResultSet getAvgTemp(String query) throws ClassNotFoundException, SQLException
	{
		
		ResultSet rs;
		
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			rs = st.executeQuery(query);
			
			
			if(rs!=null)
			{
				return rs;
			}
			else{
				return null;
			}
		
		
		
		
	}
	
	
	
	public String getSensorNames(String query)
	{
		String sensor_names = null;
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			
			if(rs!=null)
			{
				while(rs.next()){
			
					sensor_names= rs.getString("sensor_tag_value");
					
				}
			}
			else{
				return null;
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		
		return sensor_names;
	}
	
	
	
public HashMap<String, Object> getSensorLatLongName(String query)
{
	
	HashMap<String, Object> multiValues = new HashMap<String, Object>();
	ArrayList<Double> lat = new ArrayList<Double>();
	ArrayList<Double> lon = new ArrayList<Double>();
	ArrayList<String> names = new ArrayList<String>();
	
	int i=0;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(query);
		
		
		if(rs!=null)
		{
			while(rs.next()){
				
				
				lat.add(Double.parseDouble(rs.getString("latitude")));
				lon.add(Double.parseDouble((rs.getString("longitude"))));
				names.add(rs.getString("sensor_tag_value"));
				i++;
			}
		
		multiValues.put("lat", lat);
		multiValues.put("lon", lon);
		multiValues.put("names", names);
		
		}
		else{
			return null;
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	return multiValues;
	
	
}
	
	
public HashMap<String, String> getCpuUtilizationbySensorIFd(String q)
{
	HashMap<String, String> avgCPu = new HashMap<>();
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sensordb?useSSL=false", "root","root");
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(q);
		
		
		if(rs!=null)
		{
			while(rs.next()){
				
				
				avgCPu.put(rs.getString("sensor_id"), rs.getString("avgutil"));
			}
		
		}
		else{
			return null;
		}
	}
	catch(Exception e){
		e.printStackTrace();
	}
	
	
	return avgCPu;
	
}

	
	
}
