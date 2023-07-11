package pvt.servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pvt.database.UserManagement;
import pvt.modules.Level_One;
import pvt.modules.Level_Two;
import pvt.modules.StaffMember;
import pvt.modules.User;

import java.io.IOException;

@WebServlet(name="UpdateProfile",urlPatterns = {"/UpdateProfile"})
public class UpdateProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public UpdateProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserManagement um=new UserManagement();
		
		int result=0;
		if(request.getParameter("update") != null) {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String address=request.getParameter("address");
			String role=request.getParameter("role");
			String dob=request.getParameter("dob");
			
			
			User user=new User(name,dob,email,address,password,role);
			user.setId(Integer.valueOf(request.getParameter("id")));
			result=um.updateProfile(user);
			
			
			if(result>0) {
				response.sendRedirect("profile.jsp");
			}
			System.out.println("abc");
			
		}
	}

}
