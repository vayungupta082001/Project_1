package admin_java;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myCon_pack.myCon;

import java.sql.ResultSet;

/**
 * Servlet implementation class admin_java
 */
@WebServlet("/admin_java")
public class admin_java extends HttpServlet {
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		response.setContentType("text/html");
		PrintWriter pw =response.getWriter();
		String uname,password; 
		uname=request.getParameter("uname");
		password=request.getParameter("password");
		
		try {
			Connection con = myCon.getCon();
			System.out.println("connected");
			String script="select * from login_history where Username = '"+uname+"' and Password = '"+password+"' ";
			System.out.println(script);
			//pw.print(script);
			//	pw.print("hiii");
			
			PreparedStatement st=con.prepareStatement(script);
			ResultSet  rs =st.executeQuery();
			//pw.print("<table border='1'> ");
			//pw.print("<h1>Students Table</H1>");
			if (rs.next()) {
				//response.sendRedirect("admin/dashboard.jsp");
//				pw.print("done");
				response.sendRedirect("admin/dashboard.jsp");
			}
			else {
//				pw.print("not done");
				response.sendRedirect("admin/index.jsp");
				//response.sendRedirect("index.jsp");
			}
			//pw.print("</table>");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
	
}
