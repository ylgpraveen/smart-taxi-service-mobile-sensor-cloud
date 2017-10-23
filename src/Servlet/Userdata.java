package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.UDVO;
import database.UserDAO;

/**
 * Servlet implementation class Userdata
 */
public class Userdata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Userdata() {
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
		List<UDVO> ls = new ArrayList<UDVO>();
		UserDAO u = new UserDAO();
		HttpSession ses = request.getSession();
		int user_id = (int) ses.getAttribute("user");
		ls = u.display(user_id);
		System.out.println("servelet \n servlet");
		for(UDVO v : ls){
			System.out.println(v.getSensor_id());
			System.out.println(v.getSensor_tag_value());
			System.out.println(v.getSensor_status());
			System.out.println(v.getTemp());
		}
		
		ses.setAttribute("sensor", ls);
		response.sendRedirect("userDashBoard.jsp");
	}

}
