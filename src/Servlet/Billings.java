package Servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import VO.BillingVO;
import database.BillingsDAO;

/**
 * Servlet implementation class Billings
 */
public class Billings extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Billings() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		NumberFormat formater = new DecimalFormat("#0.00");
		List<BillingVO> ls = new ArrayList<BillingVO>();
		BillingsDAO u = new BillingsDAO();
		ls = u.display();
		System.out.println("servelet \n servlet");
		/*for(BillingVO v : ls){
			System.out.println(v.getSensor_name());
			System.out.println(v.getCost());
			System.out.println(v.getUp_time());
		}*/
		HttpSession ses = request.getSession();
		ses.setAttribute("billings", ls);
		double total=0;
		for(BillingVO vt : ls){
			total += Double.parseDouble(vt.getCost());
		}
		String total1 = formater.format(total);
		ses.setAttribute("totals", total1);
		System.out.println("total cost   " + total);
		response.sendRedirect("billingAdmin.jsp");
	}

}
