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


String question=request.getParameter("question");
String a=request.getParameter("a");
String b=request.getParameter("b");
String c=request.getParameter("c");
String d=request.getParameter("d");
String crctans=request.getParameter("crctans");




try
{

Connection conn = Provider.getOracleConnection();
Statement st=conn.createStatement();

int count=1;
String sql="select * from que";
		ResultSet rs=st.executeQuery(sql);
		while(rs.next())
		{

			count++;
		}


int i=st.executeUpdate("insert into que values('"+count+"','"+question+"','"+a+"','"+b+"','"+c+"','"+d+"','"+crctans+"')");

out.println("<h1>Question added succesfully</h1>");
response.sendRedirect("zQtable.jsp");
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