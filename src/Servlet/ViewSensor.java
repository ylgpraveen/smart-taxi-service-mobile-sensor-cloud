package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Controller.TempClass;
import VO.BillingVO;
import VO.SensorDetailsVO;
import VO.UDVO;
import database.BillingDAO;
import database.DatabaseAccess;
import database.SensorDetailsDAO;
import database.UserDAO;
import invoke.InvokeInstance;

/**
 * Servlet implementation class CreateSensor
 */
public class ViewSensor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewSensor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	
		HttpSession ses = request.getSession();
//		int user_id = (int) ses.getAttribute("user");
//		int user_id =1;
//	   String sensor_name = request.getParameter("sensorname");
//	   String lat = request.getParameter("lat");
//	   String lon = request.getParameter("lon");
//	   System.out.println("tag value"+sensor_name);
//	   
//	   String filePath = getServletContext().getRealPath("\\WebContent\\KEYSENSOR.pem");
//	   InvokeInstance invok = new InvokeInstance();
//	   TempClass temp= new TempClass();
//	   try {
//		   
//		   temp.createinstance(String.valueOf(user_id), sensor_name, lat, lon);
//		   //invok.createSensor(String.valueOf(user_id), sensor_name, lat, lon);
//	   } catch (InterruptedException e) {
//		// TODO Auto-generated catch block
//		   e.printStackTrace();
//	   }
//	   
//	System.out.println("Sensor Created");
//	
//	List<UDVO> ls = new ArrayList<UDVO>();
//	UserDAO u = new UserDAO();
//	ls = u.display(user_id);
//	System.out.println("servelet \n servlet");
//	for(UDVO v : ls){
//		System.out.println(v.getSensor_id());
//		System.out.println(v.getSensor_tag_value());
//		System.out.println(v.getSensor_status());
//		System.out.println(v.getTemp());
//	}
//
//	ses.setAttribute("sensor", ls);
//	response.sendRedirect("userDashBoard.jsp");
		
/*		String sensorName=request.getParameter("sensorName");
		String sensorDesc = request.getParameter("sensorDesc");
		String sensorType= request.getParameter("sensorType");
		String sensorCluster=request.getParameter("sensorCluster");
		String latitude=request.getParameter("latitude");
		String longitude=request.getParameter("longitude");
		String status=request.getParameter("status");
		int zipcode=Integer.parseInt(request.getParameter("zipcode"));
		String address1=request.getParameter("address1");
		String address2=request.getParameter("address2");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
		Date d = new Date();
		String query = "INSERT INTO sensor_details (sensor_name,sensor_desc,sensor_type,sensor_cluster,latitude,longitude,sensor_status,zipcode,address1,address2,city,state,country)"
									 + " VALUES ('"+sensorName+"','"+sensorDesc+"','"+sensorType+"','"+sensorCluster+"','"+latitude+"','"+longitude+"','"+status+"','"+zipcode+"','"+address1+"','"+address2+"','"+city+"','"+state+"','"+country+"')";
		DatabaseAccess db = new DatabaseAccess();
		db.insert(query);*/
		
		Double srcLat = Double.parseDouble(request.getParameter("srcLat"));
		Double srcLong = Double.parseDouble(request.getParameter("srcLong"));
		Double destLong = Double.parseDouble(request.getParameter("destLong"));
		Double destLat = Double.parseDouble(request.getParameter("destLat"));
		String state = request.getParameter("state");
		
		if(state.equals("findCab")){
			
			List<SensorDetailsVO> ls = new ArrayList<SensorDetailsVO>();
			SensorDetailsDAO u = new SensorDetailsDAO();
			ls = u.display();
			
			float distance = 0;
			double cabLat = 0;
			double cabLong = 0;
			
			int i=0;	
			for(SensorDetailsVO sdvo : ls){
				float calcDistance = ViewSensor.distFrom(srcLat, srcLong, sdvo.getLatitude(), sdvo.getLongitude());
				if(i==0 || (calcDistance < distance) ){
					distance = calcDistance;
					cabLat = sdvo.getLatitude();
					cabLong = sdvo.getLongitude();
				}
				i++;
			}
			
			String cabCoordinates = Double.toString(cabLat)+","+Double.toString(cabLong);
					
					
//			System.out.println("servelet \n servlet");
//			for(UDVO v : ls){
//				System.out.println(v.getSensor_id());
//				System.out.println(v.getSensor_tag_value());
//				System.out.println(v.getSensor_status());
//				System.out.println(v.getTemp());
//			}
			
			/*ses.setAttribute("sensor", ls);
			response.sendRedirect("viewSensors.jsp");*/
			
			//request.setAttribute("sensor", ls);
			//request.getRequestDispatcher("/WEB-INF/persons.jsp").forward(request, response);
			response.setContentType("text/plain");
			response.getWriter().write(cabCoordinates);
			
		}else{
			
			Date date = new Date();
			
			float calcDistance = ViewSensor.distFrom(srcLat, srcLong, destLat, destLong);
			
			float cost = calcDistance * 2 ;
			
			java.sql.Timestamp dOT = new java.sql.Timestamp(date.getTime());
			
			String query = "INSERT INTO trip_details (dateOfTravel,tripSource,tripDest,distance,cost)"
					 + " VALUES ('"+dOT+"','"+srcLat+"','"+destLat+"','"+calcDistance+"','"+cost+"')";
			DatabaseAccess db = new DatabaseAccess();
			db.insert(query);
			
			response.setContentType("text/plain");
			response.getWriter().write(Double.toString(calcDistance));
			/*
			RequestDispatcher dispatcher = request.getRequestDispatcher("book.jsp");
	        dispatcher.forward(request, response);*/
	        
		}
		   
		
		
		//response.sendRedirect("login_new.jsp");
	
	}
	
	public static float distFrom(double lat1, double lng1, double lat2, double lng2) {
	    double earthRadius = 6371000; //meters
	    double dLat = Math.toRadians(lat2-lat1);
	    double dLng = Math.toRadians(lng2-lng1);
	    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
	               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
	               Math.sin(dLng/2) * Math.sin(dLng/2);
	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
	    float dist = (float) (earthRadius * c);

	    return dist;
	 }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
