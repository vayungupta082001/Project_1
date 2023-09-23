package myCon_pack;

import java.sql.Connection;
import java.sql.DriverManager;

public class myCon 
{
	public static Connection getCon() throws Exception
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://sql12.freesqldatabase.com:3306/sql12648490","sql12648490","IRvMwntPKw");
		return con;
	}
}
