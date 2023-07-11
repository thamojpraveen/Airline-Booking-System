
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Home</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
           
		<% if(session.getAttribute("email")==null){ %>
		<%@include file="main_header.jsp" %>
		<%}else{ %>
		<%@include file="user_header.jsp" %>
		<%} %>
        
                <br><br> <br><br> <br><br><br>
            <h1 style="color: #fff;padding: 0px; margin: 40px; ">The Sky is Waiting for You</h1>
            <p style="color:#fff; padding: 0px; margin: 40px;">With cheap flights,you can easily book any ticket you need to travel safly <br>thanks. to our detailed system of search and booking airline tickets.</p>
        
                 
		
		<div class="container" style="width: 100%; height:650px"></div>
		<%@include file="footer.jsp" %>
	</body>
</html>