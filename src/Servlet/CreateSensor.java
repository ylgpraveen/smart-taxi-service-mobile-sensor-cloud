package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;

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
public class CreateSensor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateSensor() {
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
//		//int user_id =1;
//	   String sensor_name = request.getParameter("sensorname");
//	   String lat = request.getParameter("lat");
//	   String lon = request.getParameter("lon");
//	   System.out.println("tag value"+sensor_name);
//	   
////	   String filePath = getServletContext().getRealPath("\\WebContent\\KEYSENSOR.pem");
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
		
		String sensorName=request.getParameter("sensorName");
		String sensorDesc = request.getParameter("sensorDesc");
		String[] sensorTypeRaw= request.getParameterValues("sensorType");
		int sensorCluster=Integer.parseInt(request.getParameter("sensorCluster"));
		String latitude=request.getParameter("latitude");
		String longitude=request.getParameter("longitude");
		String status=request.getParameter("status");
		int zipcode=Integer.parseInt(request.getParameter("zipcode"));
		String address1=request.getParameter("addressLine1");
		String address2=request.getParameter("addressLine2");
		String city=request.getParameter("city");
		String state=request.getParameter("state");
		String country=request.getParameter("country");
			
		
		TimeZone.setDefault(TimeZone.getTimeZone("PST"));
		java.util.Date utilDate = new java.util.Date();
		System.out.println("date  " + utilDate );
		java.sql.Timestamp sq = new java.sql.Timestamp(utilDate.getTime());
		System.out.println("timestamp  "+sq);
		
		StringBuilder strBuilder = new StringBuilder();
		for (int i = 0; i < sensorTypeRaw.length; i++) {
		   strBuilder.append(sensorTypeRaw[i]+", ");
		}
		String sensorType = strBuilder.toString();
		
		String query = "INSERT INTO sensor_details (sensor_name,sensor_desc,sensor_type,sensor_cluster,sensor_status,zipcode,address1,address2,city,state,country,creation_date,latitude,longitude)"
									 + " VALUES ('"+sensorName+"','"+sensorDesc+"','"+sensorType+"','"+sensorCluster+"','"+status+"','"+zipcode+"','"+address1+"','"+address2+"','"+city+"','"+state+"','"+country+"','"+sq+"','"+latitude+"','"+longitude+"')";
		DatabaseAccess db = new DatabaseAccess();
		db.insert(query);
		
		List<SensorDetailsVO> ls = new ArrayList<SensorDetailsVO>();
		SensorDetailsDAO u = new SensorDetailsDAO();
		ls = u.display();
//		System.out.println("servelet \n servlet");
//		for(UDVO v : ls){
//			System.out.println(v.getSensor_id());
//			System.out.println(v.getSensor_tag_value());
//			System.out.println(v.getSensor_status());
//			System.out.println(v.getTemp());
//		}
		
		request.setAttribute("sensor", ls);
		//request.getRequestDispatcher("/WEB-INF/persons.jsp").forward(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewSensors.jsp");
        dispatcher.forward(request, response);
		
		//response.sendRedirect("login_new.jsp");
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
