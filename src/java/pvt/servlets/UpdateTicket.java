package pvt.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pvt.modules.Ticket;
import pvt.modules.User;

import java.io.IOException;

@WebServlet(name="UpdateTicket",urlPatterns = {"/UpdateTicket"})
public class UpdateTicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTicket() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("updateTicket")!=null) {
			Ticket ticket=new Ticket();
			User user=new User();
			
			ticket.setEmail(request.getParameter("email"));
			ticket.setNumberOfSeats(Integer.valueOf(request.getParameter("numberOfSeats")));
			ticket.setFlightId(Integer.valueOf(request.getParameter("id")));
			ticket.setId(Integer.valueOf(request.getParameter("tid")));
			
			int result=user.updateTicket(ticket);
			
			if(result>0) {
				response.sendRedirect("user_dashboard.jsp");
			}
		}
	}

}
