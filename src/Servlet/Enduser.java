package Servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseAccess;

/**
 * Servlet implementation class Enduser
 */

public class Enduser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	public Enduser() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String src=request.getParameter("Source");
		String dest=request.getParameter("Destination");
		String date = request.getParameter("Date");
		String distance=request.getParameter("Distance");
		String cost=request.getParameter("Cost");
		
		double earthRadius=6371000;
		double lat2 = 37.3382; //san jose
		double lat1 = 37.3541; //santaclara
		double dLat = Math.toRadians(lat2-lat1);
		    double lng2 = 121.8863; // san jose
			double lng1 = 121.9552; //santaclara
			double dLng = Math.toRadians(lng2-lng1);
		    double a = Math.sin(dLat/2) * Math.sin(dLat/2) +
		               Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
		               Math.sin(dLng/2) * Math.sin(dLng/2);
		    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
		    float dist = (float) (earthRadius * c);
		    System.out.println(dist);
		String query = "INSERT INTO trip_details (Date_of_Travel,Trip_source,Trip_des,Distance,Cost)"
				 + " VALUES ('"+date+"','"+src+"','"+dest+"','"+distance+"','"+cost+"')";
		DatabaseAccess db = new DatabaseAccess();
		db.insert(query);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("book.jsp");
        dispatcher.forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		

	}

}
