<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body background="images/bg-01.jpg">

<%@ page import="db.*"%>

<%@page import="java.sql.*,java.io.*" %>
<%



String userid=request.getParameter("userid");
String name=request.getParameter("name");
String password=request.getParameter("password");

String id1=null;
String uid="anupsampuu"; 


try
{
	Connection conn = Provider.getOracleConnection();
	Statement st=conn.createStatement();



String sql="select * from stdnt";
ResultSet ru=st.executeQuery(sql);
while(ru.next())
{
 id1=ru.getString("userid");
 if(id1.equals(userid))
     {
		uid=id1;
      }

}


if(uid.equals(userid))
	
	{
	response.sendRedirect("zStable.jsp?id=1");

	}
		
else
   {

String sql1="select count(name) from stdnt";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=rc.getInt(1);
count++;

int i=st.executeUpdate("insert into stdnt values('"+count+"','"+userid+"','"+name+"','"+password+"')");
out.println("<h1>Data is successfully inserted!</h1></br>");
response.sendRedirect("zStable.jsp");
    
   }
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
out.println("Operation Failed.Try again");
}
		
		
		
		
	

%>


</body>
</html>