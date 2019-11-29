package db;


import java.sql.*;


public class Provider{

public static Connection getOracleConnection()
  {

	Connection conn=null;
	try
	{
		Class.forName("oracle.jdbc.OracleDriver");
		conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","lit");
	}
    catch(Exception e)
    {
    	e.printStackTrace();
    }
return conn;
  }

}