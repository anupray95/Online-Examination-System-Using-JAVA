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
	String instruction=request.getParameter("instruction");
	try{
		Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
	String oldinstr= (String) session.getAttribute("oldinstr");
	


	
	String sql="update instr set instruction='"+instruction+"' where instruction='"+oldinstr+"'";
	
	
	int status=st.executeUpdate(sql);
	%><jsp:forward page="zItable.jsp"/>
	<%
		}

	catch(Exception e)
	{

	}


	%>

				
			
		</center>
	</main>
</body>
</html>