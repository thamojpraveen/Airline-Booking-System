<%@page import="pvt.modules.Flight"%>
<%@page import="java.util.List"%>
<%@page import="pvt.database.FlightManagement"%>
<%@page import="pvt.database.TicketManagement"%>
<%@page import="java.util.List"%>
<%@page import="pvt.modules.User"%>
<%@page import="pvt.modules.Ticket"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Seat Booking</title>
	<link rel="stylesheet" href="./Styles/main.css">
	<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	
</head>
<body>

	<%@include file="checkUser.jsp" %>
	<%@include file="user_header.jsp" %>
		<section style="background-color: #eee;opacity: 0.85">
		  <div class="container py-5">
		  	<h2>Book Seat</h2>
		  <%
		  	Flight flight=new Flight();
			
			flight.setId(Integer.valueOf(request.getParameter("id")));
			
			FlightManagement fm=new FlightManagement();
			
			flight=fm.getOneFlightDetails(flight);
			if(flight!=null){
				
				
			%>
			  		    <div class="row justify-content-center p-3">
			
			
		      <div class="col-md-8 col-lg-6 col-xl-4">
		     
		        <div class="card" style="border-radius: 15px;">
		          <div class="bg-image hover-overlay ripple ripple-surface ripple-surface-light"
		            data-mdb-ripple-color="light">
		            <img src="images/flight.jpg"
		              style="border-top-left-radius: 15px; border-top-right-radius: 15px;" class="img-fluid"
		              alt="Laptop" />
		            <a href="#!">
		              <div class="mask"></div>
		            </a>
		          </div>
		          <div class="card-body pb-0">
		            <div class="d-flex justify-content-between">
		              <div>
		                <p><a href="#!" class="text-dark"><%=flight.getFlightNumber() %></a></p>
		                <p class="small text-muted"><%=flight.getDate() %></p>
		              </div>
		            </div>
		          </div>
		          <hr class="my-0" />
		          <div class="card-body pb-0">
		            <div class="d-flex justify-content-between">
		              <p><%=flight.getDepartLocation() %></a></p>
		              <p class="text-dark"><%=flight.getArrivalLocation() %></p>
		            </div>
		            <div class="d-flex justify-content-between">
		              <p><%=flight.getDepartTime() %></a></p>
		              <p class="text-dark"><%=flight.getArrivalTime() %></p>
		            </div>
		            <p class="small text-muted">Rs: <%=flight.getTicketPrice() %></p>
		            <p class="small text-muted">Number Of Seats : <%=flight.getNumberOfSeats() %></p>
		            
		          </div>
		          
		          <hr class="my-0" />
		          <div class="card-body">
		            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
		              <form action="BookTicket" method="post" style="width: 23rem;">
		              	
		              	<div class="form-outline mb-4">
		              		<label class="form-label" for="form2Example18">Number Of Seats</label>
			              <input type="number" id="form2Example18" class="form-control form-control-lg" name="numberOfSeats" />
			              
			              <input type="text" name="email" value="<%=session.getAttribute("email")%>" hidden>
						  <input type="text" name="id" value="<%=flight.getId() %>" hidden>
			            </div>
		              	<div class="pt-1 mb-4">
			            	<input class="btn btn-info btn-lg btn-block" type="submit" name="generateTicket" value="Generate Ticket">
			        
			            </div>
		              </form>
		            </div>
		          </div>
		        </div>
		      </div>
		    
		    </div>
		    <%} %>
		  </div>
		</section>
		
		<%@include file="footer.jsp" %>	
        </body>
      </htm>
