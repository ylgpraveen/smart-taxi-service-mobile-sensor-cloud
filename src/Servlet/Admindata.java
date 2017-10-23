package Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.ADVO;
import database.AdminDAO;
import database.UserDAO;

/**
 * Servlet implementation class Admindata
 */
public class Admindata extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admindata() {
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
		List<ADVO> ls = new ArrayList<ADVO>();
		AdminDAO u = new AdminDAO();
		ls = u.display();
		System.out.println("servelet \n servlet");
		for(ADVO v : ls){
			System.out.println(v.getHub_id());
			System.out.println(v.getNo_of_server());
			System.out.println(v.getHub_status());
			
		}
		HttpSession ses = request.getSession();
		ses.setAttribute("hub", ls);
		response.sendRedirect("adminDashboard.jsp");
	}

}
