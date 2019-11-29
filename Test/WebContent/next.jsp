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
String ans=request.getParameter("q");
int serial=0;


 try {
	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();

String sql1="select count(a) from que";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=	rc.getInt(1);
		

		String sql4="select * from qc";
		ResultSet rb=st.executeQuery(sql4);
		while(rb.next())
		{
		serial=rb.getInt("count");
		}
		++serial;
		String sql5="update qc set count='"+serial+"'";
		st.execute(sql5);
		
		
		
		if(serial > count)
		{
			String sql2="update qc set count=1";
			st.executeUpdate(sql2);
			response.sendRedirect("mark.jsp");	
		}
		response.sendRedirect("Qall.jsp");
 }
 catch(Exception e)
 {
	 
 }
		
		%>
		



</body>
</html>