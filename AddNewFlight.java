package pvt.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pvt.database.FlightManagement;
import pvt.modules.Flight;
import pvt.modules.Level_Two;
import pvt.modules.StaffMember;

import java.io.IOException;

@WebServlet(name="AddNewFlight",urlPatterns = {"/AddNewFlight"})
public class AddNewFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AddNewFlight() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Flight flight=new Flight();
		Level_Two lv2=new Level_Two();
	String role=request.getParameter("role");
			
			int result=lv2.addNewFlightDetails(flight);
			
			if(result>0) {
				response.sendRedirect("staff_dashboard.jsp");
				
			}
				else {
				response.sendRedirect("add_new_flight.jsp");
			}
		}
	}

}
	

