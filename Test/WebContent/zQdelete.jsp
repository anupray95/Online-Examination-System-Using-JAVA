<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<center><h1>Instruction</h1></center>
<%@ page import="db.*"%>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%

	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
	String sql="delete from que where a='"+request.getParameter("id")+"'";
	
	try{
	int rs=st.executeUpdate(sql);
	%><jsp:forward page="zQtable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}

	st.close();
	conn.close();
	%>

				
			
		</center>
	</main>
</body>
</html>