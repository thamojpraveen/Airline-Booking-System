<%@page import="pvt.database.UserManagement"%>
<%@page import="pvt.modules.StaffMember"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	StaffMember sm=new StaffMember();
	sm.setId(Integer.valueOf(request.getParameter("id")));
	
	UserManagement um=new UserManagement();
	
	int result=um.activateStaffMember(sm);
	
	if(result>0){
		response.sendRedirect("admin_dashboard.jsp");
	}
	

%>
</body>
</html>