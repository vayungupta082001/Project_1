package admin_java;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import myCon_pack.myCon;

@WebServlet("/update")
public class update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public update() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String descrip = request.getParameter("description");
		String date = request.getParameter("date");
		String price = request.getParameter("price");
		//FString imgpath = request.getParameter("img");
		
		try {
			Connection con = null;
			try {
				con = myCon.getCon();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("connected");
			
			// Update query using prepared statement to prevent SQL injection
			String script = "UPDATE producttable SET Name=?, Date=?, Description=?, Price=? WHERE ID=?";
			PreparedStatement st = con.prepareStatement(script);
			st.setString(1, name);
			st.setString(2, date);
			st.setString(3, descrip);
			st.setString(4, price);
			st.setString(5, id);
			
			int rowsAffected = st.executeUpdate();
			
			if (rowsAffected > 0) {
				response.sendRedirect("admin/dashboard.jsp");
			} else {
				response.sendRedirect("admin/index.jsp");
			}
		} catch (SQLException e) {
			// Handle database errors
			e.printStackTrace();
		} catch (Exception e) {
			// Handle class not found errors for database driver
			e.printStackTrace();
		}
	}
}
