package Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.joda.time.LocalDate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import VO.JsonObject;
import VO.LatLng;
import VO.SensorDetailsVO;
import VO.UsersTableVO;
import database.DatabaseAccess;
import database.SensorDetailsDAO;
import database.UserDAO;
import database.UsersTable;

/**
 * Servlet implementation class Charts
 */
public class Charts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Charts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	
		
		HttpSession ses =request.getSession();
		int id = (int) ses.getAttribute("user");
		
		UsersTable uDAO = new UsersTable();
		UsersTableVO vo = uDAO.display(id);
		
		
		// also get sensor_name
		/*String q = "SELECT sensor_id FROM sensordb.sensor_master where user_id="+id;
		DatabaseAccess db = new DatabaseAccess();
		ArrayList<String> sensor_ids = db.getSensorID(q);
		
		ArrayList<String> dates = new ArrayList<String>();
		String msg=null;
		LocalDate now = LocalDate.now();
		ArrayList<ArrayList<Double>> data = null;
		ArrayList<String> sensor_names= new ArrayList<String>();
		
		for(int i=0; i <15 ; i++)
		{
			dates.add(now.minusDays(14-i).toString());
			System.out.println(dates.get(i));
		}
		
			
		
		if(sensor_ids!=null)
		{
			try {
				data = getTempDetails(sensor_ids,dates);
				
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
		
		
		
		request.setAttribute("data", data);
		request.setAttribute("dates", dates);
		request.setAttribute("msg", msg);
		request.setAttribute("sensornames", sensor_names);
		System.out.println("in charts servlet");*/
		
		List<SensorDetailsVO> ls = new ArrayList<SensorDetailsVO>();
		SensorDetailsDAO u = new SensorDetailsDAO();
		ls = u.display();
		
		
		List<JsonObject> markerList = new ArrayList<JsonObject>();
		ObjectMapper mapper = new ObjectMapper();
		
		String jsonInput = null;
		
		for(SensorDetailsVO v : ls){
			JsonObject markerData = new JsonObject();
			List<String> sensorDetail = new ArrayList<String>();
			sensorDetail.add(0,Integer.toString(v.getSensor_id()));
			sensorDetail.add(1,v.getSensor_name());
			sensorDetail.add(2,v.getSensor_desc());
			sensorDetail.add(3,Integer.toString(v.getSensor_cluster()));
			sensorDetail.add(4,v.getSensor_type());
			sensorDetail.add(5,v.getSensor_status());
			sensorDetail.add(6,Integer.toString(v.getZipcode()));
			sensorDetail.add(7,v.getCity());
			sensorDetail.add(8,v.getState());
			sensorDetail.add(9,v.getCountry());
			
			markerData.setRoutes(sensorDetail);
			
			//replace with a switch case
			 switch (v.getSensor_cluster()) {
	            case 101:  jsonInput = "[{\"latlng\":[37.335848, -121.908412]},{\"latlng\":[37.33646, -121.908864]},{\"latlng\":[37.336773, -121.909575]},{\"latlng\":[37.337246, -121.909753]},{\"latlng\":[37.338005, -121.910908]},{\"latlng\":[37.338322, -121.911176]},{\"latlng\":[37.339489, -121.912422]},{\"latlng\":[37.340069, -121.913056]},{\"latlng\":[37.340564, -121.913509]},{\"latlng\":[37.3412, -121.914087]},{\"latlng\":[37.341652, -121.914739]},{\"latlng\":[37.342493, -121.915685]},{\"latlng\":[37.342008, -121.915043]},{\"latlng\":[37.341218, -121.914967]},{\"latlng\":[37.340635, -121.915541]},{\"latlng\":[37.340224, -121.91628]},{\"latlng\":[37.339675, -121.917004]},{\"latlng\":[37.338966, -121.918288]},{\"latlng\":[37.338864, -121.918377]},{\"latlng\":[37.337402, -121.918748]},{\"latlng\":[37.336411, -121.918288]},{\"latlng\":[37.336389, -121.91811]},{\"latlng\":[37.335333, -121.916286]},{\"latlng\":[37.334974, -121.916066]}]";
	                     break;
	            case 102:  jsonInput = "[{\"latlng\":[37.335008, -121.907442]},{\"latlng\":[37.334541, -121.906997]},{\"latlng\":[37.333927, -121.906286]},{\"latlng\":[37.333757, -121.907352]},{\"latlng\":[37.333636, -121.908508]},{\"latlng\":[37.333529, -121.908864]},{\"latlng\":[37.333398, -121.910553]},{\"latlng\":[37.332977, -121.91167]},{\"latlng\":[37.332209, -121.912509]},{\"latlng\":[37.332927, -121.91162]},{\"latlng\":[37.333417, -121.910864]},{\"latlng\":[37.334033, -121.910064]},{\"latlng\":[37.334678, -121.909042]},{\"latlng\":[37.335069, -121.909042]},{\"latlng\":[37.334761, -121.907264]}]";
	                     break;
	            case 103:  jsonInput = "[{\"latlng\":[37.33357,-121.910731]},{\"latlng\":[37.332975,-121.911709]},{\"latlng\":[37.332958,-121.913746]},{\"latlng\":[37.331262,-121.916288]},{\"latlng\":[37.328905,-121.917755]},{\"latlng\":[37.326796,-121.915265]},{\"latlng\":[37.323951,-121.913654]},{\"latlng\":[37.323642,-121.913604]},{\"latlng\":[37.32249,-121.913639]},{\"latlng\":[37.322061,-121.913618]},{\"latlng\":[37.322371,-121.913598]},{\"latlng\":[37.32336,-121.913604]},{\"latlng\":[37.32394,-121.913646]},{\"latlng\":[37.325501,-121.913724]},{\"latlng\":[37.326603,-121.913834]},{\"latlng\":[37.327742,-121.912346]},{\"latlng\":[37.328858,-121.911835]},{\"latlng\":[37.331431,-121.912598]},{\"latlng\":[37.334142,-121.909575]},{\"latlng\":[37.334756,-121.90753]}]";
	                     break;
	           /* case 104:  jsonInput = "[{\"latlng\":[37.334885, -121.907352]},{\"latlng\":[37.334492,-121.906908]},{\"latlng\":[37.332914,-121.905116]},{\"latlng\":[37.332918,-121.904596]},{\"latlng\":[37.328317,-121.904818]},{\"latlng\":[37.328804,-121.905219]},{\"latlng\":[37.328498,-121.905841]},{\"latlng\":[37.328986,-121.905219]},{\"latlng\":[37.328717,-121.904863]},{\"latlng\":[37.328491,-121.904863]},{\"latlng\":[37.329398,-121.904596]},{\"latlng\":[37.329859,-121.905441]},{\"latlng\":[37.330984,-121.905574]},{\"latlng\":[37.331768,-121.905519]},{\"latlng\":37.33191,-121.904241]},{\"latlng\":[37.332899,-121.905005]},{\"latlng\":[37.33387,-121.905485]},{\"latlng\":[37.334509,-121.907352]}]";	            
	                     break;*/
	            default:  jsonInput = "[{\"latlng\":[37.335008, -121.907442]},{\"latlng\":[37.334541,-121.906997]},{\"latlng\":[37.333927,-121.906286]},{\"latlng\":[37.333757,-121.907352]},{\"latlng\":[37.333636,-121.908508]},{\"latlng\":[37.333529,-121.908864]},{\"latlng\":[37.333398,-121.910553]},{\"latlng\":[37.332977,-121.91167]},{\"latlng\":[37.332209,-121.912509]},{\"latlng\":[37.332927,-121.91162]},{\"latlng\":[37.333417,-121.910864]},{\"latlng\":[37.334033,-121.910064]},{\"latlng\":[37.334678,-121.909042]},{\"latlng\":[37.335069,-121.908242]},{\"latlng\":[37.334761,-121.907264]}]";
	                     break;
	        }
			 
			
			List<LatLng> myPoints = mapper.readValue(jsonInput, new TypeReference<List<LatLng>>(){});
			
			markerData.setPoints(myPoints);
			
			markerList.add(markerData);
		}
//		}
		
		String markerData = mapper.writeValueAsString(markerList);
		//ses.setAttribute("markerData", markerList);
		//response.sendRedirect("createSensor.jsp");
		request.setAttribute("markerData", markerData);
		//request.getRequestDispatcher("/WEB-INF/persons.jsp").forward(request, response);
		
		if(vo.getUser_type().equals("admin")){
			RequestDispatcher dispatcher = request.getRequestDispatcher("createSensor.jsp");
	        dispatcher.forward(request, response);
		}else{
			RequestDispatcher dispatcher = request.getRequestDispatcher("monitorSensorClient.jsp");
	        dispatcher.forward(request, response);
		}
        
       
		
		
		
		
	}

	/*private ArrayList<ArrayList<Double>> getTempDetails(ArrayList<String> sensor_ids, ArrayList<String> dates) throws ClassNotFoundException, SQLException {
		
		
		
		ArrayList<ArrayList<Double>> data = new ArrayList<ArrayList<Double>>();
		int index = 0;
		ArrayList<Double> data_sensor;
		DatabaseAccess db = new DatabaseAccess();
		
		for(int i=0; i<sensor_ids.size(); i++)
		{
			// add where sensor id == this
			String query = "SELECT time_stamp, AVG(temp) as avgtemp FROM sensordb.temp_data where sensor_id='"+sensor_ids.get(i)+"' group by CAST(time_stamp AS date) order by time_stamp DESC limit 15";
			
			ResultSet rs = db.getAvgTemp(query);
			data_sensor = new ArrayList<Double>();
			for(int k=0;k<15;k++)
				data_sensor.add(0.0);
			
			
			if(rs!=null)
			{
				while(rs.next())
				{	
					Date d = rs.getDate("time_stamp");  
					String temp = rs.getString("avgtemp");
					
					if(dates.contains(d.toString()))
					{
						
						System.out.println("d.tostring "+ d.toString());
						index = dates.indexOf(d.toString());
						System.out.println("dates "+dates.get(index));
						Double t = Double.parseDouble(temp);
						data_sensor.set(index, t);
					}
				
				}
				
			}
		
			data.add(data_sensor);	
			
		}
		
		
		System.out.println("return data");
		return data;
	}*/

	
	
	
	
	
	
	
	
	
	/**
	 * 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
