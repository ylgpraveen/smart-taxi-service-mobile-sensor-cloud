package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.UsersTableVO;
import database.SensorDetailsDAO;
import database.UsersTable;

/**
 * Servlet implementation class userstable
 */
public class userstable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userstable() {
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
		UsersTable dao = new UsersTable();
		List<UsersTableVO> ls = new ArrayList<UsersTableVO>();
		
		 int index = Integer.parseInt(request.getParameter("index"));
		   String action = request.getParameter("action");
		
		// ls = dao.display();
		   
		/*HttpSession ses = request.getSession();
		ses.setAttribute("userinfo", ls);
		System.out.println("IN SERVLET");*/
		
//		for(UsersTableVO l : ls){
//			System.out.println(l.getNUMBER_SENSOR());
//			System.out.println(l.getStatus());
//			System.out.println(l.getUser_fname());
//			System.out.println(l.getUser_lname());
//			System.out.println(l.getUser_email());
//		}
		//response.sendRedirect("viewSensors.jsp");
		
		   
		SensorDetailsDAO u = new SensorDetailsDAO();
		
		//Add the code for getting sensor data for the given index in sensor details and 
		//calculate the cost by calling your billing dao class and insert the data in billing table
		//also do the same in StartStop.java file
		
		u.toggleSensorStatus(index,action);   
		
		response.setContentType("text/plain");
		response.getWriter().write(index);
		
	}

}
