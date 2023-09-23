<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ include file ="top.jsp" %>			
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Showing Product List</title>
<style type="text/css">
.styled-table {
	padding:50px;
    border-collapse: collapse;
    margin: 50px;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}

table{
	border-radius:200px;
	border:2px solid black;
}
</style>
</head>
<body>

<table class="styled-table" >
    <thead>
        <tr>
            <th>Name of Project</th>
			<th>Date</th>
			<th>Description</th>
			<th>Price in RS</th>
			<th>ID</th>
			<th>Image</th>
			<th colspan="2" style="text-align: center;">Action</th>
        </tr>
    </thead>
    <tbody>
        <tr class="active-row">
            <%try {
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
	String script="SELECT * FROM producttable";

	Statement st=con.createStatement();
	ResultSet rs =st.executeQuery(script);
	while(rs.next()) {
		//out.print("<td>"+rs.getString(1)+"</td><td>"+rs.getInt(2)+"</td><td>"+rs.getInt(3)+"</td><td>"+rs.getString(4)+"</td>");
	%>
		<tr class="active-row">
	<td><%=rs.getString(1) %></td>
	<td><%=rs.getString(2) %></td>
	<td><%=rs.getString(3) %></td>
	<td><%=rs.getString(4) %></td>
	<td><%=rs.getString(5) %></td>
	<td><img src="<%=rs.getString(6) %>" alt="<%=rs.getString(6) %>" style="height:auto;width:200px">	<a style="text-decoration: none" href="updateimg.jsp?id=<%=rs.getString(5)%>">UPDATE IMAGE</a></td>
	<td><a href="delete.jsp?id=<%=rs.getString(5)%>">DELETE</a></td>
	<td><a href="Update.jsp?id=<%=rs.getString(5)%>">UPDATE</a></td>
	
	</tr>
	<%
	}
}
catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
} %>
        </tr>
        <!-- and so on... -->
    </tbody>
</table>

</body>
</html>