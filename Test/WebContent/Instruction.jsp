<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="db.*"%>
    <%@page import="java.sql.*,java.util.*"%>
    
<!DOCTYPE html>
<html>
<head>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/inst.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<style>
hr { 
  border: 1px solid white;
  width: 10%;
} 
</style>
<style type="text/css">

		body{
			
			background-repeat: no-repeat;
			background-size: 100%;
			
		}

		h1 { color: #111; font-family: 'Helvetica Neue', sans-serif; font-size: 70px; font-weight: bold; letter-spacing: -1px; line-height: 1; text-align: center; }
		
		h2{ color:white; }
		
		a {text-decoration: none;}
	</style>
</head>
<body background="images/bg-01.jpg">


<div style=" background-color: lightblue; font-size:1.5em; padding-left: 10px; margin: 10px 0 0 10px;  text-align: left; width: 200px; border-radius: 10px;">
<i style='font-size:18px' class='fas'>&#xf2bd;</i>
<%=session.getAttribute("sname")%>
</div>


<%

try
{
	Connection conn = Provider.getOracleConnection();
	Statement st=conn.createStatement();

%> <center>
<div class="box">
  <div class="inner">
    <span>WELCOME</span>
  </div>
  <div class="inner">
    <span>WELCOME</span>
  </div>
</div></center>


<div class="w3-container" >
<section style="  border-left: 0px; border-right: 0px; margin-top: 70px;">
<%

out.println("<center><h2><strong>-<u>INSTRUCTIONS</u>-</h2></strong></center>");
%>
<center>
<section style=" border: 3px solid white; border-left: 0px; border-right: 0px; margin-top: 20px; background-color:rgba(255,255,255,0.8); width: 800px;">
<%
//update serial no for timer
String sql2="update qc set count=1";
st.executeUpdate(sql2);
int c=1;
String sql="select * from instr";
ResultSet rs=st.executeQuery(sql);


%>
<br>
<%

while(rs.next())
{

%>
    <center><h3><strong><font color="#000"><%=c %>.&nbsp;<%=rs.getString("instruction")%></font></h3></strong><br></center>

     
<%
c++;
}
c=1;
%>

</section>
</center>
</div>

<% String sql1="update counter set correct=0,attempt=0 where serialno=1";
st.executeUpdate(sql1);


}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<center>

<div style="background-color:#000; width: 12%; border-radius: 50px">
  
  <p><a href="https://en.wikipedia.org/wiki/Red">
   
  </a></p>
  
  <p ><a href="Qall.jsp">
    START
  </a></p>

  
</div>
</center>


</body>
</html>