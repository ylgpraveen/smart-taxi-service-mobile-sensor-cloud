package login;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.ADVO;
import VO.UDVO;
import database.AdminDAO;
import database.DatabaseAccess;
import database.UserDAO;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String username = request.getParameter("Username");
		String password = request.getParameter("Password");
		System.out.println(password);
		HttpSession sesid = request.getSession();
		HttpSession sest = request.getSession();
		String query = "SELECT user_password,user_id,user_type from user_master where user_email='"+username+"'";
		DatabaseAccess db = new DatabaseAccess();
		Auth aut =db.auth(query,password);
		System.out.println(aut.getId()+" "+aut.getPassword());
		
		
		if(aut.getPassword().equals(password)){
			sesid.setAttribute("user", aut.getId());
			sest.setAttribute("type", aut.getType());
			
			if(aut.getType().equals("client"))
			{
				List<UDVO> ls = new ArrayList<UDVO>();
				UserDAO u = new UserDAO();
				ls = u.display(aut.getId());
				System.out.println("servelet \n servlet");
				for(UDVO v : ls){
					System.out.println(v.getSensor_id());
					System.out.println(v.getSensor_tag_value());
					System.out.println(v.getSensor_status());
					System.out.println(v.getTemp());
				}
				HttpSession ses = request.getSession();
				ses.setAttribute("sensor", ls);
				response.sendRedirect("adminDashboard.jsp");
			
			}
			else if(aut.getType().equals("enduser"))
			{
				response.sendRedirect("Enduser.jsp");
			}
			else
			{
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
				response.sendRedirect("userDashBoard.jsp");
				
			}
		}
		else{
			sesid.setAttribute("invalid", "wrong password");
			response.sendRedirect("Login.jsp");
		}
		
		
	}

}
