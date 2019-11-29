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
<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	
	
	String question=request.getParameter("question");
	String a=request.getParameter("a");
	String b=request.getParameter("b");
	String c=request.getParameter("c");
	String d=request.getParameter("d");
	String crctans=request.getParameter("crctans");
	
	try{

		 Connection conn = Provider.getOracleConnection();
			Statement st=conn.createStatement();
	String olda= (String) session.getAttribute("olda");
	


	
	String sql="update que set question='"+question+"',a='"+a+"',b='"+b+"',c='"+c+"',d='"+d+"',crctans='"+crctans+"' where a='"+olda+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zQtable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	
</body>
</html>