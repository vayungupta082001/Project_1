<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file ="top.jsp" %>	
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Insert Project</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="design/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="design/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="design/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="design/css/util.css">
	<link rel="stylesheet" type="text/css" href="design/css/main.css">
<!--===============================================================================================-->
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100" style="background-image: url('design/images/bg-01.jpg');">
			<div class="wrap-login100 p-t-30 p-b-50">
				<span class="login100-form-title p-b-41">
				Project Data
				</span>
				<form enctype="multipart/form-data" class="login100-form validate-form p-b-33 p-t-5" action="../new_project" method="post" >

					<div class="wrap-input100 validate-input" data-validate = "Name of Project">
						<input class="input100" type="text" name="name_of_project" placeholder="Name of Project" required="required">
						<span class="focus-input100" data-placeholder="&#xe82a;"></span>
					</div>

					<div class="wrap-input100 validate-input" data-validate="Date of Upload">
						<input class="input100" type="date" name="date_of_upload" placeholder="Date of Upload" required="required">
						<span class="focus-input100" data-placeholder="&#xe836;"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Description">
						<input class="input100" type="text" name="description" placeholder="Description" required="required">
						<span class="focus-input100" data-placeholder="&#xe974;"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Price">
						<input class="input100" type="number" name="price" placeholder="Price" required="required">
						<span class="focus-input100" data-placeholder=""></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Id">
						<input class="input100" type="text" name="id" placeholder="Id" required="required">
						<span class="focus-input100" data-placeholder="&#xe951;"></span>
					</div>
					<div class="wrap-input100 validate-input" data-validate="Image">
						<input class="input100" type="file" name="img" placeholder="Image" required="required">
						<span class="focus-input100" data-placeholder="&#xe720"></span>
					</div>
					
					<div class="container-login100-form-btn m-t-32">
						<button class="login100-form-btn">
							Submit
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="design/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="design/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="design/vendor/bootstrap/js/popper.js"></script>
	<script src="design/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="design/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="design/vendor/daterangepicker/moment.min.js"></script>
	<script src="design/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="design/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="design/js/main.js"></script>

</body>
</html>