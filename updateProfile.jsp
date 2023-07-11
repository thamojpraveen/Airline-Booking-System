<%@page import="pvt.database.UserManagement"%>
    <%@page import="pvt.modules.User"%>
        <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="ISO-8859-1">
                <title>Update Profile</title>
                <link rel="stylesheet" href="./Styles/main.css">
                <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
            </head>

            <body>
                <% String role=(String)session.getAttribute("role"); %>
                    <%if(role.equals("User")){ %>
                        <%@include file="user_header.jsp" %>
                            <%}else{ %>
                                <%@include file="staff_header.jsp" %>
                                    <%} %>
                                        <div class="container rounded bg-white mt-5 mb-5" style="opacity: 0.9">
                                            <div class="row">
                                                <%
												User user=new User();
												user.setEmail((String)session.getAttribute("email"));
												
												UserManagement um=new UserManagement();
												
												user=um.viewProfile(user);
												
												if(user!=null){
											%>
                                                    <div class="col-md-3 border-right">
                                                        <div class="d-flex flex-column align-items-center text-center p-3 py-5"><img class="rounded-circle mt-5" width="150px" src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
                                                            <span class="text-black-50">
                                                                <%=user.getEmail() %>
                                                                    </span><span> </span></div>
                                                    </div>
                                                    <div class="col-md-5 border-right">
                                                        <div class="p-3 py-5">
                                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                                <h4 class="text-right">Profile Settings</h4>
                                                            </div>
                                                            <form action="UpdateProfile" method="post">
                                                                <div class="row mt-3">
                                                                    <div class="col-md-12"><label class="labels">Name</label><input class="form-control" type="text" name="name" value="<%=user.getName() %>"></div>
                                                                    <div class="col-md-12"><label class="labels">Email1</label><input class="form-control" type="email" name="email" value="<%=user.getEmail() %>"></div>
                                                                    <div class="col-md-12"><label class="labels">Password</label><input class="form-control" type="text" name="password" value="<%=user.getPassword() %>"></div>
                                                                    <div class="col-md-12"><label class="labels">Address</label><input class="form-control" name="address" value="<%=user.getAddress() %>"></div>
                                                                    <div class="col-md-12"><label class="labels">Date Of Birth</label><input class="form-control" type="date" name="dob" value="<%=user.getDob() %>"></div>
                                                                    <div class="col-md-12"><label class="labels">Role</label>
                                                                        <select class="form-control" name="role">
																		<%if(role.equals("User")){ %>
																		<option value="User">User</option>
																		<%} else if(role.equals("User")){ %>
																		<option value="Level 1">Staff Level 1</option>
																		<%}else{ %>
																		<option value="Level 2">Staff Level 2</option>
																		<%} %>
																	</select>
                                                                    </div>
                                                                    <input type="number" name="id" value="<%=user.getId() %>" hidden>

                                                                </div>

                                                                <div class="mt-5 text-center"><input class="btn btn-primary profile-button" type="submit" name="update" value="Save Profile"></div>
                                                            </form>
                                                        </div>
                                                    </div>
                                                    <%} %>
                                            </div>
                                        </div>

                                        <%@include file="footer.jsp" %>
            </body>

            </html>