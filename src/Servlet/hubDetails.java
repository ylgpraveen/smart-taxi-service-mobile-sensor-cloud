package Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;

import VO.HDVO;
import database.DatabaseAccess;
import database.HubDAO;

/**
 * Servlet implementation class hubDetails
 */
public class hubDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hubDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<HDVO> ls = new ArrayList<HDVO>();
		HubDAO u = new HubDAO();
		int hub_id=Integer.parseInt(request.getParameter("id"));
		ls = u.display(hub_id);
		System.out.println("servelet \n servlet");
		for(HDVO v : ls){
			System.out.println(v.getDate());
			System.out.println(v.getLatitude());
			System.out.println(v.getLongitude());
			System.out.println(v.getSensor_status());
			System.out.println(v.getSensor_tag_value());
			System.out.println(v.getUser_id());
		}
		HttpSession ses = request.getSession();
		ses.setAttribute("hubdetails", ls);
		ses.setAttribute("hub_id", hub_id);
		
		
		
		//cpu utilizatio graph data added
		String query = "SELECT sensor_id FROM sensordb.sensor_master where hub_id ="+hub_id;
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
		
		//ended
		
		
		ses.setAttribute("data", data);
		ses.setAttribute("dates", dates);
		ses.setAttribute("msg", msg);
		ses.setAttribute("sensornames", sensor_names);
		ses.setAttribute("sensorIds", sensor_ids);
		
		
		
		
		
		
		response.sendRedirect("adminHubDetails.jsp");
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
