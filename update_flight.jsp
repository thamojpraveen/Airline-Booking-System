<%@page import="pvt.database.FlightManagement"%>
<%@page import="pvt.modules.Flight"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Update Flight Details</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="stylesheet" href="./Styles/addFlight.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
		<%@include file="checkStaff.jsp" %>
		<%@include file="staff_header.jsp" %>
		
		<section  class="get-in-touch">
		   <h1 class="title">Update Flight Details</h1>
		   <form action="UpdateFlight" method="post" class="contact-form row">
		   	<%
				Flight flight=new Flight();
				flight.setId(Integer.valueOf(request.getParameter("id")));
				
				FlightManagement fm=new FlightManagement();
				
				flight=fm.getOneFlightDetails(flight);
			
				if(flight!=null){
			
			%>
		   
		      
		      <%} %>
		   </form>
		</section>
		
		
		<%@include file="footer.jsp" %>
	</body>
</html>