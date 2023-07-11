package pvt.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pvt.database.UserManagement;
import pvt.modules.User;

import java.io.IOException;

@WebServlet(name="login",urlPatterns = {"/login"})
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Login() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserManagement um=new UserManagement();
		int result=0;
		if(request.getParameter("login")!=null) {
			User user=new User();
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			user.setEmail(email);
			user.setPassword(password);
			result=um.checkUser(user);
			
			String ip=request.getRemoteAddr();
			
			HttpSession session=request.getSession();
			session.setAttribute("email", email);
			if(result==1) {
				session.setAttribute("role", "Level 1");
				
				um.addLoginDetails(email, "Level 1", ip);
				
				response.sendRedirect("staff_dashboard.jsp");
				
				
			}
			else if(result==2) {
				session.setAttribute("role", "Level 2");
				
				um.addLoginDetails(email, "Level 2", ip);
				
				response.sendRedirect("staff_dashboard.jsp");
				
			}
			else if(result==3) {
				session.setAttribute("role", "User");
				
				um.addLoginDetails(email, "User", ip);
				
				response.sendRedirect("user_dashboard.jsp");
				
			}
			else if(result==4) {
				session.setAttribute("role", "Admin");
				
				um.addLoginDetails(email, "Admin", ip);
				
				response.sendRedirect("admin_dashboard.jsp");
				
			}
			else {
				response.sendRedirect("login.jsp");
			}
		}
	}

}
