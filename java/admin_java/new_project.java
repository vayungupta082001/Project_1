package admin_java;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;


/**
 * Servlet implementation class new_project
 */
@WebServlet("/new_project")
public class new_project extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public new_project() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name="";
		String date="";
		String id="";
		String imgpath="";
		String descrip="";
		int price;
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		if(ServletFileUpload. isMultipartContent(request)) {
			try{ 
				List<FileItem> multiparts= new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
				System.out.println(multiparts);
				pw.print(multiparts);
				pw.print("<br>");
				for (FileItem item : multiparts) {
					if(!item.isFormField()) {
						File f=new File(item.getName());
						String fname=f.getName();
						imgpath="pics\\"+File.separator+fname;
					item.write(new File("D:\\Coding Files\\7.7.2023 LAST UPLOAD HDD\\Java_Vayun\\Vayun Eclipse\\Coding Files\\project_website\\src\\main\\webapp\\admin\\"+imgpath));
						
					}
				}
				name=multiparts.get(0).getString();
				date=multiparts.get(1).getString();
				descrip=multiparts.get(2).getString();
				price=Integer.parseInt(multiparts.get(3).getString());
				id=multiparts.get(4).getString();
				//imgpath=multiparts.get(5).getString();
				
				
				System.out.println(name);
				System.out.println(date);
				System.out.println(id);
				System.out.println(imgpath);
				System.out.println(descrip);
				System.out.println(price);
				
				try {	
					Class.forName("com.mysql.jdbc.Driver");
					Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
					//out.print("success");
					
					
					String sql="INSERT INTO `producttable`(`Name`, `Date`, `Description`, `Price`, `ID`, `Image`) VALUES ('"+name+"','"+date+"','"+descrip+"','"+price+"','"+id+"','"+imgpath+"')";
					System.out.println(sql);
					//out.print(sql);
					PreparedStatement st=con.prepareStatement(sql);
					int h=st.executeUpdate(sql);
					System.out.println("Succcess");
					response.sendRedirect("admin/dashboard.jsp");

				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					response.sendRedirect("admin/insertForm.jsp");
				}
			}
			catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

}
}