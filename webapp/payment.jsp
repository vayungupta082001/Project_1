<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ include file="top.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

@import url(https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,600);
h1, h3 {
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  font-weight:300;
  text-align:center;
}
.container {
  width:360px;
  margin:0 auto;
  position:relative;
  perspective:800;
  -webkit-perspective:800;
  -moz-perspective:800;
}
.theCard {
  width:100%;
  height:100%;
  position:absolute;
  -webkit-transition: -webkit-transform 1s;
  transition: transform 1s;
  -webkit-transform-style: preserve-3d;
  transform-style: preserve-3d;
}
figure {
  display: block;
  position: absolute;
  min-height:175px;
  width:330px;
  -webkit-backface-visibility:hidden;
  backface-visibility:hidden;
}
.theCard.flipped {
  -webkit-transform: rotateY(180deg);
}
.theCardFront,
.theCardBack{
  background-color:#96CDCD;
  border-radius:5px;
  font-family: 'Open Sans', Helvetica, Arial, sans-serif;
  margin:0 auto;
  color:#444;
  padding:15px;
}
.theCardBack {
  -webkit-transform: rotateY(180deg);
  transform:rotateY(180deg);
}
.instructions {
  text-align:center;
  float:left;
  margin:0 0 .5em;
}
.variousCards {
  float:right;
}
.cardImg {
  display:inline-block;
  margin:0 0 0 10px;
  opacity: .5;
  background-image:url('http://ivanthevariable.com/misc/codepen-credit-card/visa.jpg');
  -webkit-backface-visibility:hidden;
  backface-visibility:hidden;
}
.active {
    opacity:1;
}
.clear {
  clear:both;
  float:none;
}
small {
  margin:5px 0;
  font-style:italic;
}
.signIn,
.pay{
  display:inline-block;
  background-color:#5F9F9F;
  color:#fff;
  text-decoration:none;
  padding:5px 10px;
  border:none;
  border-radius:5px;
  border-bottom:2px solid #528B8B;
  transition: .5s background-color;
  font-weight:600;
}
.signIn:hover,
.pay:hover{
  background-color:#528b8b;
  cursor:pointer;
}
input {
  font-size:1em;
  padding:.15em;
  text-align:center;
  outline:none;
}
.cardNumber input{
  width:20.9%;
  margin:.75em .05em; 
}
.cardExpiration{
  float:left;
  width:50%;
}
.month {
  width:20%;
}
.year {
  width:35%;
}
.cardSecurity {
  float:"right";
  width:50%;
  position:relative;
  -webkit-backface-visibility:hidden;
  backface-visibility:hidden;
}
.cardSecurity small {
}
.csc {
  width:22%;
  margin:0 .5em 0 0;
}
.help {
  display:none;
  color:#fff;
  background-color:#999;
  padding:10px;
  max-width:175px;
  font-size:.85em;
  border-radius:3px;
  border-bottom:3px solid #888;
  position:absolute;
  bottom:-6em;
  right:30px;
  z-index:100;
}
.help:before {
  content:' ';
  display:inline-block;
  border-bottom:10px solid #999;
  border-left:7px solid transparent;
  border-right:7px solid transparent;
  position:absolute;
  top:-10px;
  left:15px;
}
.tooltip:hover {
  text-decoration:underline;
  cursor:pointer;
}
.tooltip:hover ~ .help{
  display:inline-block;
}
.pay,
input.signIn {
  margin:10px 0 0;
  width:100%;
}
.login input {
  width:50%;
}
input{
border:2px black solid;
border-radius: 20px;
padding:2.5px;
margin:2.5px;
}
</style>
</head>
<body>

<%

	String name;
	double pp;
	name =(String) session.getAttribute("cl_username");
	pp = (Double)session.getAttribute("total_amt");
%>

	
    <!-- Font Awesome -->
    <script
      src="https://kit.fontawesome.com/bb515311f9.js"
      crossorigin="anonymous"
    ></script>

  <body>
    <h1 style="margin-top:100px;">Pay now to obtain your items</h1>
<%try {
    		Class.forName("com.mysql.jdbc.Driver");
    		Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
    		String script="SELECT * FROM user_login where Username='"+name+"'";

    		Statement st=con.createStatement();
    		ResultSet rs =st.executeQuery(script);
    		
    		if(rs.next()) {
    			//out.print("<td>"+rs.getString(1)+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+rs.getString(4)+"</td>");
    		%>
<section class="container">
    <div class="theCard">
      <figure class="theCardFront">
      <div class="instructionsCards">  
        </div>
        <div class="instructions">
        </div>
        Name :  <input type="text" value="<%=rs.getString(1) %>" placeholder="<%=rs.getString(1) %>" readonly="readonly">
        <br>Phone : <input type="text" value="<%=rs.getString(4) %>" placeholder="<%=rs.getString(4) %>" readonly="readonly">
        <br>Email :  <input type="text" value="<%=rs.getString(5) %>" placeholder="<%=rs.getString(5) %>" readonly="readonly">
       	<br>Price : <input type="text" value="Rs.<%=pp %>" placeholder="Rs.<%=pp%>" readonly="readonly">
        
        <input type="submit" id="rzp-button1" value="Pay Now" class="pay"/>
      </figure>
      <figure class="theCardBack">
        <div class="instructions">
        </div>
      </figure>
    </div>
</section>
<script src="https://checkout.razorpay.com/v1/checkout.js"></script>
<script>
var options = {
    "key": "rzp_test_BZagLDbQEnoikk", // Enter the Key ID generated from the Dashboard
    "amount": "<%=pp*100 %>", // Amount is in currency subunits. Default currency is INR. Hence, 50000 refers to 50000 paise
    "currency": "INR",
    "name": "<%=name %>",
    "description": "Test Transaction",
    "image": "https://example.com/your_logo",
   // "order_id": "order_9A33XWu170gUtm", //This is a sample Order ID. Pass the `id` obtained in the response of Step 1
    "handler": function (response){
    	console.log(response);
      /*  alert(response.razorpay_payment_id);
        alert(response.razorpay_order_id);
        alert(response.razorpay_signature)*/
    	
    		},
    	    "prefill": {
    	        "name": "<%=rs.getString(1)%>",
    	        "email": "<%=rs.getString(5)%>",
    	        "contact": "+91 <%=rs.getString(4)%>"
    	    },
    		<%
    		}
    	}
    	catch (Exception e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	} %>
    
    "notes": {
        "address": "Razorpay Corporate Office"
    },
    "theme": {
        "color": "#3399cc"
    }
};
var rzp1 = new Razorpay(options);
rzp1.on('payment.failed', function (response){
        alert(response.error.code);
        alert(response.error.description);
        alert(response.error.source);
        alert(response.error.step);
        alert(response.error.reason);
        alert(response.error.metadata.order_id);
        alert(response.error.metadata.payment_id);
});
document.getElementById('rzp-button1').onclick = function(e){
    rzp1.open();
    e.preventDefault();
}
</script>
</body>
</html>