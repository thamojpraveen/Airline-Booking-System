package pvt.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pvt.modules.Flight;
import pvt.modules.Level_One;
import pvt.modules.Level_Two;

import java.io.IOException;

@WebServlet(name="UpdateFlight",urlPatterns = {"/UpdateFlight"})
public class UpdateFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public UpdateFlight() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Flight flight=new Flight();
		Level_One lv1=new Level_One();
		
		if(request.getParameter("updateFlight")!=null) {
			flight.setDate(request.getParameter("date"));
			flight.setArrivalTime(request.getParameter("arrivalTime"));
			flight.setDepartTime(request.getParameter("departTime"));
			flight.setFlightNumber(request.getParameter("flightNumber"));
			flight.setNumberOfSeats(Integer.valueOf(request.getParameter("numberOfSeats")));
			flight.setTicketPrice(Double.valueOf(request.getParameter("ticketPrice")));
			flight.setDepartLocation(request.getParameter("departLocation"));
			flight.setArrivalLocation(request.getParameter("arrivalLocation"));
			
			flight.setId(Integer.valueOf(request.getParameter("id")));
			
			
			int result=lv1.updateFlightDetails(flight);
			
			if(result>0) {
				
				response.sendRedirect("staff_dashboard.jsp");
				
				
			}
			
		}
	}

}
