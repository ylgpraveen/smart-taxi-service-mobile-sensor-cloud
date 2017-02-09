package VO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

/**
 * Servlet implementation class TDVO
 */
@WebServlet("/TDVO")
public class TDVO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	    private int Trip_id;
	    private String Trip_source;
	    private String Trip_des;
	    private String Trip_distance;
	    private int Trip_duration;
	    private int End_userid;
	   
	    
	    public void setTrip_id(int Trip_id) {
	 		this.Trip_id = Trip_id;
	 	}
	 	public void setTrip_source(String Trip_source) {
	 		this.Trip_source = Trip_source;
	 	}
	 	public void setTrip_des(String Trip_des) {
	 		this.Trip_des = Trip_des;
	 	}
	 	public void setTrip_distance(String Trip_distance) {
	 		this.Trip_distance = Trip_distance;
	 	}
	 	public void setTrip_duration(int Trip_duration) {
	 		this.Trip_duration = Trip_duration;
	 	}
	 	public void setEnd_userid(int End_userid) {
	 		this.End_userid = End_userid;
	 	}
	}

