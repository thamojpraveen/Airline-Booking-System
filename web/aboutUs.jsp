<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   
<meta charset="ISO-8859-1">
		<title>About US</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
</head>
<body>
    
    
		<% if(session.getAttribute("email")==null){ %>
		<%@include file="main_header.jsp" %>
		<%}else{ %>
		<%@include file="user_header.jsp" %>
		<%} %>
		
                <div class="container" style="width: 100%"; height:650px"></div>
		<%@include file="footer.jsp" %>
</body>
</html>