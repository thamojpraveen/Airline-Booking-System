<%@page import="java.sql.ResultSet"%>
<%@page import="pvt.modules.User"%>
<%@page import="java.util.List"%>
<%@page import="pvt.modules.StaffMember"%>
<%@page import="pvt.database.UserManagement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Dashboard</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
		<%@include file="checkAdmin.jsp" %>
		<%@include file="admin_header.jsp" %>
		
		
		<section style="background-color: #eee;opacity: 0.85">
			<hr class="m-5">
		  <div class="container py-5">
		  	<h2>Staff Management</h2>
		  	<div class="card-body">
	            <div class="d-flex justify-content-between align-items-center pb-2 mb-1">
	            	<a href="add_new_Staff_memebr.jsp"><button type="button" class="btn btn-primary">Add new Staff Member</button></a>
	              	
	            </div>
	          </div>
	          
		  	<table class="table">
		  	  
			  <thead class="thead-dark">
			    <tr>
			      	<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">DOB</th>
					<th scope="col">Address</th>
					<th>Role</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
					UserManagement um=new UserManagement();
					
					List<StaffMember> sf_list=um.getStaffMembers();
					int i=0;
					while(i<sf_list.size()){
				%>
			    <tr>
			      
			     	<td scope="row"><%=sf_list.get(i).getId() %></td>
					<td scope="row"><%=sf_list.get(i).getName() %></td>
					<td scope="row"><%=sf_list.get(i).getEmail() %></td>
					<td scope="row"><%=sf_list.get(i).getPassword() %></td>
					<td scope="row"><%=sf_list.get(i).getDob() %></td>
					<td scope="row"><%=sf_list.get(i).getAddress() %></td>
					<td scope="row"><%=sf_list.get(i).getRole() %></td>
					<td scope="row"><%=sf_list.get(i).getAcc_status() %></td>
					<td scope="row">
					<% if(sf_list.get(i).getAcc_status().equals("Activated")){ %>
						<a href="deactivate_staff_member.jsp?id=<%=sf_list.get(i).getId() %>"><button type="button" class="btn btn-primary">De-Activate</button></a>
					<%}else{ %>
						<a href="activate_staff_member.jsp?id=<%=sf_list.get(i).getId() %>"><button type="button" class="btn btn-primary">Activate</button></a>
					<%} %>
						<a href="remove_staff_member.jsp?id=<%=sf_list.get(i).getId() %>"><button type="button" class="btn btn-warning">Remove</button></a>
					</td>
				</tr>
				<%i++;} %>
			   
			    
			  </tbody>
			</table>
		  </div>
		  <hr class="m-5">
		</section>
		
		
		<section style="background-color: #eee;opacity: 0.85">
		  <div class="container py-5">
		  	
	          <h2>User Management</h2>
		  	<table class="table">
		  	  
			  <thead class="thead-dark">
			    <tr>
			      	<th scope="col">Id</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Password</th>
					<th scope="col">DOB</th>
					<th scope="col">Address</th>
					<th>Role</th>
					<th scope="col">Status</th>
					<th scope="col">Action</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
				
					List<User> user_list=um.getUsers();
					i=0;
					while(i<user_list.size()){
				%>
			    <tr>
			      
			     	<td scope="row"><%=user_list.get(i).getId() %></td>
					<td scope="row"><%=user_list.get(i).getName() %></td>
					<td scope="row"><%=user_list.get(i).getEmail() %></td>
					<td scope="row"><%=user_list.get(i).getPassword() %></td>
					<td scope="row"><%=user_list.get(i).getDob() %></td>
					<td scope="row"><%=user_list.get(i).getAddress() %></td>
					<td scope="row"><%=user_list.get(i).getRole() %></td>
					<td scope="row"><%=user_list.get(i).getAcc_status() %></td>
					<td scope="row">
						<a href="remove_staff_member.jsp?id=<%=user_list.get(i).getId() %>"><button type="button" class="btn btn-warning">Remove</button></a>
					</td>
				</tr>
				<%i++;} %>
			   
			    
			  </tbody>
			</table>
		  </div>
		 <hr class="m-5">
		</section>
		
		
		<section style="background-color: #eee;opacity: 0.85">
		  <div class="container py-5">
		  	
	          <h2>Login Details</h2>
		  	<table class="table">
		  	  
			  <thead class="thead-dark">
			    <tr>
					<th scope="col">Email</th>
					<th scope="col">Role</th>
					<th scope="col">Time</th>
					<th scope="col">Ip</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<%
				
				  	ResultSet rs=um.getLoginDetails();
					while(rs.next()){
				%>
			    <tr>

					<td scope="row"><%=rs.getString("email") %></td>
					<td scope="row"><%=rs.getString("role") %></td>
					<td scope="row"><%=rs.getString("time") %></td>
					<td scope="row"><%=rs.getString("ip") %></td>
				</tr>
				<%i++;} %>
			   
			    
			  </tbody>
			</table>
		  </div>
		 <hr class="m-5">
		</section>
		
		<%@include file="footer.jsp" %>
	</body>
</html>