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


int serialno=Integer.parseInt(request.getParameter("serialno"));


try {
	Connection conn = Provider.getOracleConnection();

String sql="delete from que where serialno=?";
PreparedStatement pst=conn.prepareStatement(sql);
pst.setInt(1,serialno);
int status=pst.executeUpdate();



if(status>0)
{
	out.println("<center><h1>Question deleted Successsfully</h1></center>");
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