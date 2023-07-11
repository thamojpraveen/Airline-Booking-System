<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Registration</title>
		<link rel="stylesheet" href="./Styles/main.css">
		<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon" />
	</head>
	<body>
	
		<%@include file="main_header.jsp" %>
		
		
		<section class="vh-200" style="background-color: #eee;opacity: 0.9;">
		  <div class="container h-100">
		    <div class="row d-flex justify-content-center align-items-center h-200">
		      <div class="col-lg-12 col-xl-11">
		        <div class="card text-black" style="border-radius: 25px;">
		          <div class="card-body p-md-5">
		            <div class="row justify-content-center">
		              <div class="col-md-10 col-lg-6 col-xl-5 order-2 order-lg-1">
		
		                <p class="text-center h1 fw-bold mb-5 mx-1 mx-md-4 mt-4">Sign up</p>
		
		                <form  method="post" action="registration" class="mx-1 mx-md-4">
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="text" id="form3Example1c" class="form-control" name="name" />
		                      <label class="form-label" for="form3Example1c">Your Name</label>
		                    </div>
		                  </div>
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-envelope fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="email" id="form3Example3c" class="form-control" name="email" />
		                      <label class="form-label" for="form3Example3c">Your Email</label>
		                    </div>
		                  </div>
		
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-lock fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="password" id="form3Example4c" class="form-control" name="password" />
		                      <label class="form-label" for="form3Example4c">Password</label>
		                    </div>
		                  </div>
							
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-key fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="password" id="form3Example4cd" class="form-control" name="con_password"/>
		                      <label class="form-label" for="form3Example4cd">Repeat your password</label>
		                    </div>
		                  </div>
		
							
						 <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="date" id="dateid" class="form-control" name="dob" />
		                      <label class="form-label" for="form3Example1c">Your Birth Day</label>
		                    </div>
		                  </div>
		                  
		                  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                      <input type="text" id="addressId" class="form-control" name="address" />
		                      <label class="form-label" for="form3Example1c" name="address">Your Address</label>
		                    </div>
		                  </div>	
							
						  <div class="d-flex flex-row align-items-center mb-4">
		                    <i class="fas fa-user fa-lg me-3 fa-fw"></i>
		                    <div class="form-outline flex-fill mb-0">
		                    
		                    	<select name="role" class="form-control">
									<option selected>Please Select Your Role</option>
									<option value="1">Staff Member Level 1</option>
									<option value="2">Staff Member Level 2</option>
									<option value="0">User</option>
								</select>
		                
		                      <label class="form-label" for="form3Example1c" name="address">Your Role</label>
		                    </div>
		                  </div>
							
		                  <div class="form-check d-flex justify-content-center mb-5">
		                    <input class="form-check-input me-2" type="checkbox" value="" id="form2Example3c" />
		                    <label class="form-check-label" for="form2Example3">
		                      I agree all statements in <a href="#!">Terms of service</a>
		                    </label>
		                  </div>
		
		                  <div class="d-flex justify-content-center mx-4 mb-3 mb-lg-4">
		                  	<input class="btn btn-primary btn-lg" type="submit" name="register" value="Register">
		                    
		                  </div>
		
		                </form>
		
		              </div>
		              <div class="col-md-10 col-lg-6 col-xl-7 d-flex align-items-center order-1 order-lg-2">
		
		                <img src="images/signup.jpeg"
		                  class="img-fluid" alt="Sample image">
		
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		  </div>
		</section>
		
		
		<%@include file="footer.jsp" %>
	</body>
</html>