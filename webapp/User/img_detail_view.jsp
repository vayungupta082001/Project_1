<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ include file="top.jsp" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>Product Details</title>
    <style>
        /* Add your CSS styles here */
        table{
        	margin:2px;
        }
        td{
        padding:10px;
        }
    </style>
</head>
<body bgcolor="lightgrey">

<%
    String id = request.getParameter("id");
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
        String script = "SELECT * FROM producttable WHERE ID = ?";
        PreparedStatement ps = con.prepareStatement(script);
        ps.setString(1, id);

        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
%>
<form action="../add_to_cart" method="post">
            <div class="product-details">
            
            <table style="cellspacing:20px; cellpadding:20px; margin:100px">
                <tr><td><div class="product-image">
                    <img style="border:2px black solid; border-radius:20px; height:200px; width:auto;" src="../admin/<%= rs.getString(6) %>" alt="Product Image">
                </div></td><td><div class="product-info">
                    
                    <h2><%= rs.getString(1) %></h2>
                    <p><%= rs.getString(2) %></p>
                    <p><%= rs.getString(3) %></p>
                    <p><%= rs.getString(4) %></p>
                    
                        <input type="hidden" name="id" value="<%= rs.getString(5) %>">
                        <label for="quantity">Quantity:</label>
                        <select style="border:2px black solid; border-radius:20px;" name="quantity" id="quantity">
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select><br>
                        <button type="submit" style="bgcolor:grey; border:2px black solid; border-radius:20px;">Add to Cart</button>
                    
                </div></tr>td><tr>
                </table>
            </div>
  </form>
<%
        }
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

</body>
</html>
