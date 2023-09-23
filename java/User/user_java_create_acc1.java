package User;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class user_java_create_acc1
 */
@WebServlet("/user_java_create_acc1")
public class user_java_create_acc1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public user_java_create_acc1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String name, uname, password, phone;
		name=request.getParameter("name");
		phone=request.getParameter("phone");
		uname=request.getParameter("uname");
		password=request.getParameter("password");
		String email=request.getParameter("email");

				try {	
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
					//out.print("success");
					
					
					String sql="INSERT INTO user_login ( Name, Username, Password, Phone, Email) VALUES ('"+name+"','"+uname+"','"+password+"','"+phone+"', '"+email+"')";
					System.out.println(sql);
					//out.print(sql);
					PreparedStatement st=con.prepareStatement(sql);
					int h=st.executeUpdate(sql);
					System.out.println("Succcess");
					response.sendRedirect("User/user_login.jsp");

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					response.sendRedirect("User/create_acc.jsp");
				} 
	}

}
		