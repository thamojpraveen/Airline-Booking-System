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
		   <h1 class="title">Update Flight</h1>
		   <form action="UpdateFlight" method="post" class="contact-form row">
		   	<%
				Flight flight=new Flight();
				flight.setId(Integer.valueOf(request.getParameter("id")));
				
				FlightManagement fm=new FlightManagement();
				
				flight=fm.getOneFlightDetails(flight);
			
				if(flight!=null){
			
			%>
		   
		      <div class="form-field col-lg-6">
		         <input id="name" class="input-text js-input" type="text" name="flightNumber" value="<%=flight.getFlightNumber()%>" required>
		         <label class="label" for="name">Flight Number</label>
		      </div>
		      <div class="form-field col-lg-6 ">
		         <input id="email" class="input-text js-input" type="number" name="numberOfSeats" value="<%=flight.getNumberOfSeats()%>" required>
		         <label class="label" for="email">Number Of Seats</label>
		      </div>
		      <div class="form-field col-lg-6 ">
		         <input id="company" class="input-text js-input" type="text" name="departLocation" value="<%=flight.getDepartLocation()%>" required>
		         <label class="label" for="company">Depart Location</label>
		      </div>
		       <div class="form-field col-lg-6 ">
		         <input id="phone" class="input-text js-input" type="text" name="arrivalLocation" value="<%=flight.getArrivalLocation()%>" required>
		         <label class="label" for="phone">Arrival Location</label>
		      </div>
		      <div class="form-field col-lg-6 ">
		         <input id="company" class="input-text js-input" type="time" name="departTime" value="<%=flight.getDepartTime()%>" required>
		         <label class="label" for="company">Depart Time</label>
		      </div>
		       <div class="form-field col-lg-6 ">
		         <input id="phone" class="input-text js-input" type="time" name="arrivalTime" value="<%=flight.getArrivalTime()%>" required>
		         <label class="label" for="phone">Arrival Time</label>
		      </div>
		      <div class="form-field col-lg-6 ">
		         <input id="company" class="input-text js-input" type="number" name="ticketPrice" value="<%=flight.getTicketPrice()%>" required>
		         <label class="label" for="company">Ticket Price</label>
		      </div>
		       <div class="form-field col-lg-6 ">
		         <input id="phone" class="input-text js-input" type="date" name="date" value="<%=flight.getDate()%>" required>
		         <label class="label" for="phone">Date</label>
		         <input type="text" name="role" value="<%=session.getAttribute("role") %>" hidden>
		      </div>
		      <div class="form-field col-lg-12">
		      	<input type="text" name="id" value="<%=flight.getId()%>" hidden>
		         <input type="submit"class="submit-btn"  name="updateFlight" value="Update Flight">
		      </div>
		      <%} %>
		   </form>
		</section>
		
		
		<%@include file="footer.jsp" %>
	</body>
</html>