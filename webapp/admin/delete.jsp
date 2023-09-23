<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id=request.getParameter("id");
//PrintWriter pw=response.getWriter();
//pw.print(id);

try {  
    Class.forName("com.mysql.jdbc.Driver");
    Connection connection = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");

    PreparedStatement st = connection.prepareStatement("DELETE FROM producttable WHERE ID = '" + id + "';");
    st.executeUpdate();
    response.sendRedirect("show_products.jsp");
} catch(Exception e) {
	e.printStackTrace();
}

%>
</body>
</html>