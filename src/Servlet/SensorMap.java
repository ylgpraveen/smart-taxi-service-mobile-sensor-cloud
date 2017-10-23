package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.SensorDetailsVO;
import database.DatabaseAccess;
import database.SensorDetailsDAO;

/**
 * Servlet implementation class SensorMap
 */
public class SensorMap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SensorMap() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		HttpSession ses = request.getSession();
		
		List<SensorDetailsVO> ls = new ArrayList<SensorDetailsVO>();
		SensorDetailsDAO u = new SensorDetailsDAO();
		ls = u.display();
		
		ses.setAttribute("sensor", ls);
		response.sendRedirect("viewSensors.jsp");
		
		//int user_id = (int) ses.getAttribute("user");
		
		/*String query = "SELECT latitude,longitude,sensor_tag_value FROM sensordb.sensor_master where user_id = '"+String.valueOf(user_id)+"'";
		DatabaseAccess db = new DatabaseAccess();
		HashMap<String, Object> multivalue = db.getSensorLatLongName(query);
	
		ArrayList<String> names = (ArrayList<String>) multivalue.get("names");
		ArrayList<Double> lat = (ArrayList<Double>) multivalue.get("lat");
		ArrayList<Double> lon = (ArrayList<Double>) multivalue.get("lon");
		
		request.setAttribute("names", names);
		request.setAttribute("lat", lat);
		request.setAttribute("lon", lon);
		
		 RequestDispatcher dispatcher = request.getRequestDispatcher("sensorMap.jsp");
	        dispatcher.forward(request, response);*/
	       
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
