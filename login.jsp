<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Login</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="stylesheet" href="./Styles/login.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
		
	</head>
	<body>
		<%@include file="main_header.jsp" %>

		
		<section class="vh-100">
			  <div class="container-fluid">
			    <div class="row">
			      <div class="col-sm-6 text-black">
			
			        <div class="px-5 ms-xl-4">
			          <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
			          <span class="h1 fw-bold mb-0"></span>
			        </div>
			
			        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">
			
			          <form action="login" method="post" style="width: 23rem;">
			
			            <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Log in</h3>
			
			            <div class="form-outline mb-4">
			              <input type="email" id="form2Example18" class="form-control form-control-lg" name="email"/>
			              <label class="form-label" for="form2Example18">Email address</label>
			            </div>
			
			            <div class="form-outline mb-4">
			              <input type="password" id="form2Example28" class="form-control form-control-lg" name="password"/>
			              <label class="form-label" for="form2Example28">Password</label>
			            </div>
			
			            <div class="pt-1 mb-4">
			            	<input class="btn btn-info btn-lg btn-block" type="submit" name="login" value="Login">
			              <!--<button class="btn btn-info btn-lg btn-block" type="button">Login</button>-->
			            </div>
			
			            <p class="small mb-5 pb-lg-2"><a class="text-muted" href="#!">Forgot password?</a></p>
			            <p>Don't have an account? <a href="registration.jsp" class="link-info">Register here</a></p>
			
			          </form>
			
			        </div>
			
			      </div>
			      <div class="col-sm-6 px-0 d-none d-sm-block">
			        <img src="images/login.jpeg" alt="Login image" class="w-100 vh-100" style="opacity: 0.6;object-fit: cover; object-position: left;box-sizing: 1px">
			      </div>
			    </div>
			  </div>
		</section>
		
		
		
		
		<%@include file="footer.jsp" %>
	</body>
</html>