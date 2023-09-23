package User;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Cart_p.cart_data;

/**
 * Servlet implementation class add_to_cart
 */
@WebServlet("/add_to_cart")
public class add_to_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public add_to_cart() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
		response.setContentType("text/html");
		String id, quantity;
		id=request.getParameter("id");
		quantity=request.getParameter("quantity");
		System.out.print("id, quantity");
		PrintWriter pw=response.getWriter();
//		pw.print(id+ quantity);
		
		
		try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
	        String script = "SELECT * FROM producttable WHERE ID = ?";
	        PreparedStatement ps = con.prepareStatement(script);
	        ps.setString(1, id);

	        ResultSet rs = ps.executeQuery();
	        HttpSession ses = request.getSession();
	        
	      
	        
	        if (rs.next()) {
	        	 cart_data cd = new cart_data(rs.getString(6), quantity, id, rs.getString(1), rs.getString(4));
	        	 
	        	if(ses.getAttribute("cart_record")==null)
	        	{
	        		ArrayList<cart_data> cart = new ArrayList<cart_data>();
	        		cart.add(cd);
	        		ses.setAttribute("cart_record", cart);
	        	}
	        	else
	        	{
	        		ArrayList<cart_data> all = (ArrayList<cart_data>)ses.getAttribute("cart_record");
	        		int f =0;
	        		for (cart_data cp:all)
	        		{
	        			if(cp.getId().equals(id))
	        			{
	        				int qt = Integer.parseInt(cp.getQuantity())+Integer.parseInt(quantity);
	        				cp.setQuantity(""+qt);
	        				f=1;
	        			}
	        		}
	        		if(f==0)
	        		{
	        			all.add(cd);
	        			ses.setAttribute("cart_record", all);
	        		}
	        		response.sendRedirect("User/add_cart.jsp");
	        	}
	        }
	        con.close();
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}

}
