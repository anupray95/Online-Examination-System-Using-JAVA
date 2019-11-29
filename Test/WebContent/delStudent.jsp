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

String userid=request.getParameter("userid");


try {
	
	Connection conn = Provider.getOracleConnection();

String sql="delete from stdnt where userid=?";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setString(1,userid);
int status=pst.executeUpdate();



if(status>0)
{
	out.println("<center><h1>Student Deleted Succesfully</h1></center>");
	out.print("<a href='AdminLogin2.jsp'>BACK</a>");
}
else
{
out.println("hhii");
}



}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("hey");
}
%>



</body>
</html>