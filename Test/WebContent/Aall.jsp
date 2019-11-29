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

 try {

	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
		
		

String sql1="select count(a) from que";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=	rc.getInt(1);
		
		int serial=0;
		int correct=0;
		int attempt=0;
		

		String sql4="select * from qc";
		ResultSet rb=st.executeQuery(sql4);
		while(rb.next())
		{
		serial=rb.getInt("count");
		}
		String sql="select * from que where serialno='"+serial+"'";
		ResultSet rs=st.executeQuery(sql);
		
		
		
	
		while(rs.next())
		{
			
	String crctans=rs.getString("crctans");
	if(ans.equals(crctans))
	{
		
		
		String sql6="select * from counter";
		ResultSet ra=st.executeQuery(sql6);
		
		while(ra.next())
		{
			
			correct=ra.getInt(2);
			attempt=ra.getInt(3);
      }
		
	
		correct++;
		attempt++;
		String sql2="update counter set correct='"+correct+"',attempt='"+attempt+"'";
		st.executeUpdate(sql2);
	
		
		
	}
	else
	{
		
		

		String sql5="select * from counter";
		ResultSet ra=st.executeQuery(sql5);
		while(ra.next())
		{
      correct=ra.getInt("correct");
      attempt=ra.getInt("attempt");
		}
	
		attempt++;
		String sql2="update counter set correct='"+correct+"',attempt='"+attempt+"'";
		st.executeUpdate(sql2);
	
	}
	
	
	
	serial++;
	String sql3="update qc set count='"+serial+"'";
	st.executeUpdate(sql3);
	if(serial > count)
	{
		String sql2="update qc set count=1";
		st.executeUpdate(sql2);
		response.sendRedirect("mark.jsp");	
	}
	response.sendRedirect("Qall.jsp");
		}


}
catch(Exception e)
{
	%>
	<script>

alert("Please Select an option !");
window.location.href = "Qall.jsp";
</script>
	
	<%
}


%>
</body>
</html>