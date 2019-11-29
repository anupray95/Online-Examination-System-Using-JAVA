<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="db.*"%>
<%@page import="java.sql.*,java.io.*" %>
<%

String userid=request.getParameter("suid");
String password=request.getParameter("spwd");
String sname=null;
out.println("hello");

try {
	Connection conn = Provider.getOracleConnection();
	Statement st=conn.createStatement();

	String id1=null;
	String uid=null;
	String upd="sdkjfskd0";
	

	
	String sql="select * from stdnt";
	ResultSet ru=st.executeQuery(sql);
	while(ru.next())
	{
	 id1=ru.getString("userid");
	 if(id1.equals(userid))
	     {
		 uid=id1;
		upd=ru.getString(4); 
		sname=ru.getString("name");
		session.setAttribute("sname",sname);
		
	      }
	
	}
	

	if(upd.equals(password))
		
		{
			out.println("login successful");
		response.sendRedirect("Instruction.jsp");
		}
			
	else
	   {
		out.println("unsuccessful");
		response.sendRedirect("StudentLogin.html?id=1");
	    
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