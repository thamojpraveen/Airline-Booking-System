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

@WebServlet(name = "Registration",urlPatterns = {"/Registration"})
public class Registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Registration() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserManagement um=new UserManagement();
		int result=0;
		if(request.getParameter("user") != null) {
			String name=request.getParameter("name");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String address=request.getParameter("address");
			String role=request.getParameter("role");
			String dob=request.getParameter("dob");
			if(role.equals("1")) {
				StaffMember stm=new Level_One(name,dob,email,address,password,"Level 1");
				result=um.addNewStaffMember(stm);
			}
			else if(role.equals("2")) {
				StaffMember stm=new Level_Two(name,dob,email,address,password,"Level 2");
				result=um.addNewStaffMember(stm);
			}
			else {
				User user=new User(name,dob,email,address,password,"User");
				result=um.addNewUser(user);
			}
			
			if(result>0) {
				response.sendRedirect("login.jsp");
			}
			else {
				response.sendRedirect("registration.jsp");
			}
		}
	}

}
