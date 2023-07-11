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

@WebServlet(name="addNewStaff",urlPatterns = {"/addNewStaff"})
public class AddNewStaff extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AddNewStaff() {
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
		if(request.getParameter("register") != null) {
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
			
			if(result>0) {
				response.sendRedirect("admin_dashboard.jsp");
			}
			else {
				response.sendRedirect("add_new_Staff_member.jsp");
			}
		}
	}

}
