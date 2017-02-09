package Servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.BillingVO;
import VO.SensorDetailsVO;
import database.BillingDAO;
import database.DatabaseAccess;
import database.SensorDetailsDAO;
import database.UserDAO;

/**
 * Servlet implementation class Billing
 */
public class Billing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Billing() {
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
		
		String sensorName=request.getParameter("sensor_name");
		String sensorID=request.getParameter("sensor_id");
		String sensor_type = request.getParameter("sensor_type");
		//String[] sensorTypeRaw= request.getParameterValues("sensorType");
		//int sensorCluster=Integer.parseInt(request.getParameter("sensorCluster"));
		/*String latitude=request.getParameter("latitude");
		String longitude=request.getParameter("longitude")*/;
		String uptime=request.getParameter("uptime");
		int cost=Integer.parseInt(request.getParameter("cost"));
		
		String query = "INSERT INTO sensor_details (sensor_id,sensor_name,senor_type,uptime,cost)"
									 + " VALUES ('"+sensorID+"','"+sensorName+"','"+sensor_type+"','"+uptime+"','"+cost+"')";
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("billingUser.jsp");
        dispatcher.forward(request, response);
		
	}

}
