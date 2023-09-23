<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="top.jsp" %>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
 <%@ page import ="java.util.ArrayList" %>
  <%@ page import ="Cart_p.cart_data" %>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<style type="text/css">* {
    margin: 0;
    padding: 0;
}
body {
    background-color: #F2EEE9;
    font: normal 13px/1.5 Georgia, Serif;
    color: #333;
}
.wrapper {
    width: 705px;
    margin: 20px auto;
    padding: 20px;
}
h1 {
    display: inline-block;
    background-color: #333;
    color: #fff;
    font-size: 20px;
    font-weight: normal;
    text-transform: uppercase;
    padding: 4px 20px;
    float: left;
}

.clear {
    clear: both;
}
.items {
    display: block;
    margin: 20px 0;
}
.item {
    background-color: #fff;
    float: left;
    margin: 0 10px 10px 0;
    width: 205px;
    padding: 10px;
    height: 290px;
}
.item img {
    display: block;
    margin: auto;
}
h2 {
    font-size: 16px;
    display: block;
    border-bottom: 1px solid #ccc;
    margin: 0 0 10px 0;
    padding: 0 0 5px 0;
}
button {
    border: 1px solid #722A1B;
    padding: 4px 14px;
    background-color: #fff;
    color: #722A1B;
    text-transform: uppercase;
    float: right;
    margin: 5px 0;
    font-weight: bold;
    cursor: pointer;
}
span {
    float: right;
}
.shopping-cart {
    display: inline-block;
    background: url('http://cdn1.iconfinder.com/data/icons/jigsoar-icons/24/_cart.png') no-repeat 0 0;
    width: 24px;
    height: 24px;
    margin: 0 10px 0 0;
}
#div{
	width:"auto";
	height:"auto";
}
</style>
</head>
<body>

<!-- <script type="text/javascript">
/*
Add to cart fly effect with jQuery. - May 05, 2013
(c) 2013 @ElmahdiMahmoud - fikra-masri.by
license: https://www.opensource.org/licenses/mit-license.php
*/   

$('.add-to-cart').on('click', function () {
    var cart = $('.shopping-cart');
    var imgtodrag = $(this).parent('.item').find("img").eq(0);
    if (imgtodrag) {
        var imgclone = imgtodrag.clone()
            .offset({
            top: imgtodrag.offset().top,
            left: imgtodrag.offset().left
        })
            .css({
            'opacity': '0.5',
                'position': 'absolute',
                'height': '150px',
                'width': '150px',
                'z-index': '100'
        })
            .appendTo($('body'))
            .animate({
            'top': cart.offset().top + 10,
                'left': cart.offset().left + 10,
                'width': 75,
                'height': 75
        }, 1000, 'easeInOutExpo');
        
        setTimeout(function () {
            cart.effect("shake", {
                times: 2
            }, 200);
        }, 1500);

        imgclone.animate({
            'width': 0,
                'height': 0
        }, function () {
            $(this).detach()
        });
    }
});</script>-->
	<!-- wrapper -->
<div class="wrapper" style="margin-top: 100px">
     <h1>Shopping Cart :</h1>
 <span><i class="shopping-cart"></i></span>

    <div class="clear"></div>
    <!-- items -->
    <div class="items">
    <%
	ArrayList<cart_data> all = (ArrayList<cart_data>)session.getAttribute("cart_record");
	int i=0;
	if(all ==null)
	{
		%>
			<h1>Cart is Empty</h1>
		<%
	}
	else
	{
		double gtp=0;
	for(cart_data cp:all)
	{%>
        <!-- single item -->
        <div id="div" class="item">
        <img src="../admin/<%out.print(cp.getImage()); %>" style="width:auto; height:90px;"alt="img"></td>
		
        	<h2><%=cp.getName()%></h2>
        	<h2>Total : <%=cp.getTotalPrice() %></h2>
			<% gtp = gtp+cp.getTotalPrice();
				session.setAttribute("total_amt",gtp);
				%>
            <p>Price : <em>Rs.<%=cp.getPrice()%></em>
            <p>Quantity : <em><%=cp.getQuantity()%></em>
            </p>
            <button class="add-to-cart" onclick="window.location.href = '../remove_pro?index=<%= i++ %>'" style="text-decoration: none; font-family:Arial;" >Remove</button></td>
        </div>
        <%}		
	%>
	<br>
	<h1>Total Cost : Rs.<%=gtp%><br><button onclick="window.location.href = '../checkout'">checkout</button></h1>		
	<%
	}
%>
<br>
	
		
    </div>
    <!--/ items -->
</div>
<!--/ wrapper -->
</table>
</body>
</html>