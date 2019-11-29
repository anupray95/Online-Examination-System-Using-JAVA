<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<%@ page import="db.*"%>

<%@page import="java.sql.*,java.io.*" %>
<%

String userid=request.getParameter("auid");
String password=request.getParameter("apwd");
String aname=null;
out.println("hello");

try {
	Connection conn = Provider.getOracleConnection();
	Statement st=conn.createStatement();

	String id1=null;
	String uid=null;
	String upd="sdkjfskd8342857362";
	

	
	String sql="select * from admin";
	ResultSet ru=st.executeQuery(sql);
	while(ru.next())
	{
	 id1=ru.getString("userid");
	 if(id1.equals(userid))
	     {
		 uid=id1;
		upd=ru.getString("password"); 
		aname=ru.getString("name");
		session.setAttribute("aname",aname);
		
	      }
	
	}
	

	if(upd.equals(password))
		
		{
			out.println("login successful");
		response.sendRedirect("AdminLogin2.jsp");
		}
			
	else
	   {
		out.println("unsuccessful");
		response.sendRedirect("AdminLogin.html?id=1");
	    
	   }
	
	}


	catch(Exception e)
	{
		out.println("hello");

	System.out.print(e);
	e.printStackTrace();
	}

%>


</body>
</html>