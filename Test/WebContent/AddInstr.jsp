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


String instruction=request.getParameter("instruction");




try
{
	Connection conn = Provider.getOracleConnection();
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into instr values('"+instruction+"')");
out.println("Data is successfully inserted!");
response.sendRedirect("zItable.jsp");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("hi");
}
		
		
		
		

%>




</body>
</html>