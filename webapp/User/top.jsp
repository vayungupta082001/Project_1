<!DOCTYPE html>
<html>
<head>
<title>Vayun Website</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
</head>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="index.jsp" class="w3-bar-item w3-button"><b>BR</b> Architects</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
    <a href="add_cart.jsp" class="w3-bar-item w3-button">Cart</a>
      <a href="#projects" class="w3-bar-item w3-button">Projects</a>
      <a href="#about" class="w3-bar-item w3-button">About</a>
      <% if(session.getAttribute("cl_username")==null){ %>
       <a href="create_acc.jsp" class="w3-bar-item w3-button">SignUp</a>
        <a href="user_login.jsp" class="w3-bar-item w3-button">LogIn</a>
        <% }else{ %>
          <a href="../logout" class="w3-bar-item w3-button">LogOut</a>
          <% } %>
      <% //cl_username %>
      </div>
  </div>
</div>
		
	<!-- Header -->
	<header class="w3-display-container w3-content w3-wide" style="max-width:1500px;" id="home">
	  <!-- <img class="w3-image"  src="https://www.w3schools.com/w3images/architect.jpg" alt="Architecture" width="1500" height="800">
	   -->
	   <div class="w3-display-middle w3-margin-top w3-center">
	   	</div>
	</header>
