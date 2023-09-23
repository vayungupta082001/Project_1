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
try
{

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
	
}
catch(Exception e)
{
	e.printStackTrace();
}
%>
</body>
</html>