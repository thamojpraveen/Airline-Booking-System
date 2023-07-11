<%@page import="pvt.modules.Flight"%>
<%@page import="java.util.List"%>
<%@page import="pvt.database.FlightManagement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Flight Details</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
	<% if(session.getAttribute("email")==null){ %>
	<%@include file="main_header.jsp" %>
	<%}else{ %>
	<%@include file="user_header.jsp" %>
	<%} %>
		
		
		<section style="background-color: #eee;opacity: 0.85">
		  <div class="container py-5">
		  	<h2>Flight Details</h2>
		  <%
				FlightManagement fm=new FlightManagement();
			
				List<Flight> flights=fm.getFlightDetails();
				
				int i=0;
				while(i<flights.size()){
			%>
		  	<% if(i%3==0){System.out.println(i); %>
		    <div class="row justify-content-center p-3">
			<%} %>
			
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
		                <p><a href="#!" class="text-dark"><%=flights.get(i).getFlightNumber() %></a></p>
		                <p class="small text-muted"><%=flights.get(i).getDate() %></p>
		              </div>
		            </div>
		          </div>
		          <hr class="my-0" />
		          <div class="card-body pb-0">
		            <div class="d-flex justify-content-between">
		              <p><%=flights.get(i).getDepartLocation() %></a></p>
		              <p class="text-dark"><%=flights.get(i).getArrivalLocation() %></p>
		            </div>
		            <div class="d-flex justify-content-between">
		              <p><%=flights.get(i).getDepartTime() %></a></p>
		              <p class="text-dark"><%=flights.get(i).getArrivalTime() %></p>
		            </div>
		            <p class="small text-muted">Rs: <%=flights.get(i).getTicketPrice() %></p>
		            <p class="small text-muted">Number Of Seats : <%=flights.get(i).getNumberOfSeats() %></p>
		            
		          </div>
		          <hr class="my-0" />
		          <div class="card-body">
		            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
		              
		              <a href="book_seat.jsp?id=<%=flights.get(i).getId() %>"><button type="button" class="btn btn-primary">Book Seat</button></a>
		            </div>
		          </div>
		        </div>
		      </div>
		    <% if(i%3==0 && i!=0){ %>
		    </div>
		    <%}i++;} %>
		  </div>
		</section>
		
		<%@include file="footer.jsp" %>
	</body>
</html>