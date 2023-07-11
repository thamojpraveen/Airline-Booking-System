<%@page import="pvt.modules.Flight"%>
<%@page import="pvt.modules.Level_One"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@include file="checkStaff.jsp"%>
<%
	Level_One l1=new Level_One();
	
	Flight flight=new Flight();
	flight.setId(Integer.valueOf(request.getParameter("id")));
	
	int result=l1.deleteFlightDetails(flight);
	
	if(result>0){
		response.sendRedirect("staff_dashboard.jsp");
	}

%>

</body>
</html>