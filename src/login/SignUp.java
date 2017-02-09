package login;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import database.DatabaseAccess;

/**
 * Servlet implementation class SignUp
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
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
		doGet(request, response);
		String phone=request.getParameter("Phone");
		String firstName = request.getParameter("FirstName");
		String lastName= request.getParameter("LastName");
		String userName=request.getParameter("UserName");
		String password=request.getParameter("Password");
		String city=request.getParameter("City");
		int zipcode=Integer.parseInt(request.getParameter("ZIP"));
		String state=request.getParameter("State");
		String address=request.getParameter("Address");
		String user_type=request.getParameter("UserType");
		Date d = new Date();
		String query = "INSERT INTO user_master (user_email,user_password,user_fname,user_lname,phone,address,zipcode,city,state,user_type,user_status,creation_date,last_login_date)"
									 + " VALUES ('"+userName+"','"+password+"','"+firstName+"','"+lastName+"','"+phone+"','"+address+"','"+zipcode+"','"+city+"','"+state+"','"+user_type+"','active','"+d.toString()+"','')";
		DatabaseAccess db = new DatabaseAccess();
		db.insert(query);
		response.sendRedirect("Login.jsp");
		//response.sendRedirect("login_new.jsp");
	}

}
