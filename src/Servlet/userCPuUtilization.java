package Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;

import database.DatabaseAccess;

/**
 * Servlet implementation class userCPuUtilization
 */
public class userCPuUtilization extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userCPuUtilization() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
	
		
		
		HttpSession ses = request.getSession();
		int user_id = (int) ses.getAttribute("user");
		
		String query = "SELECT sensor_id FROM sensordb.sensor_master where user_id ="+user_id;
		DatabaseAccess db = new DatabaseAccess();
		ArrayList<String> sensor_ids = db.getSensorID(query);
		ArrayList<String> dates = new ArrayList<String>();
		LocalDate now = LocalDate.now();
		String msg=null;
		ArrayList<ArrayList<Double>> data = null;
		ArrayList<String> sensor_names= new ArrayList<String>();
		
	
		for(int i=0; i <10 ; i++)
		{
			dates.add(now.minusDays(9-i).toString());
			System.out.println(dates.get(i));
		}
	
		if(sensor_ids!=null)
		{
			try {
				data = getUtilizationData(sensor_ids,dates);
				
				for(int i=0;i<sensor_ids.size();i++)
				{
					String sensorname = "SELECT sensor_tag_value FROM sensordb.sensor_master where sensor_id='"+sensor_ids.get(i)+"'";
					String name = db.getSensorNames(sensorname);
					sensor_names.add(name);
					
				}
				
				msg="Sensor";
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			
			 msg = "NoSensor";
		}
	
	
		ses.setAttribute("data", data);
		ses.setAttribute("dates", dates);
		ses.setAttribute("msg", msg);
		ses.setAttribute("sensornames", sensor_names);
		ses.setAttribute("sensorIds", sensor_ids);
		
		
		
		
		
		
		response.sendRedirect("useSensorUtilization.jsp");
	
	
	
	
	
	}
	
	
	

private ArrayList<ArrayList<Double>> getUtilizationData(ArrayList<String> sensor_ids, ArrayList<String> dates) throws ClassNotFoundException, SQLException {
		
		
		
		ArrayList<ArrayList<Double>> data = new ArrayList<ArrayList<Double>>();
		int index = 0;
		ArrayList<Double> data_sensor;
		DatabaseAccess db = new DatabaseAccess();
		
		for(int i=0; i<sensor_ids.size(); i++)
		{
			// add where sensor id == this
			String query = "SELECT date, AVG(cpu_data) as avgutil FROM sensordb.utilization where sensor_id='"+sensor_ids.get(i)+"' group by CAST(date AS date) order by date DESC limit 10";
			
			ResultSet rs = db.getAvgTemp(query);
			data_sensor = new ArrayList<Double>();
			for(int k=0;k<10;k++)
				data_sensor.add(0.0);
			
			
			if(rs!=null)
			{
				while(rs.next())
				{	
					Date d = rs.getDate("date");  
					String cpu = rs.getString("avgutil");
					
					if(dates.contains(d.toString()))
					{
						index = dates.indexOf(d.toString());
						Double t = Double.parseDouble(cpu);
						data_sensor.set(index, t);
					}
				
				}
				
			}
		
			data.add(data_sensor);	
			
		}
		
		
		
		return data;
	}
	

}
