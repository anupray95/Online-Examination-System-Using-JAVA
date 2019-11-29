<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
	

<title>Online QnA</title>



	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util2.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">
	<link rel="stylesheet" type="text/css" href="css/inst.css">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
<script>
var deadline = new Date("Nov 28, 2019 11:05:30").getTime(); 
var x = setInterval(function() { 
var now = new Date().getTime(); 
var t = deadline - now; 
var days = Math.floor(t / (1000 * 60 * 60 * 24)); 
var hours = Math.floor((t%(1000 * 60 * 60 * 24))/(1000 * 60 * 60)); 
var minutes = Math.floor((t % (1000 * 60 * 60)) / (1000 * 60)); 
var seconds = Math.floor((t % (1000 * 60)) / 1000); 
document.getElementById("demo").innerHTML = hours + "h " + minutes + "m " + seconds + "s "; 
	if (t < 0) { 
		clearInterval(x); 
		window.location.href="mark.jsp"
		document.getElementById("demo").innerHTML = "EXPIRED"; 
		document.forma.p.disabled = true;
		document.forma.n.disabled = true;
		document.forma.s.disabled = true;
		
	} 
}, 1000);
</script>
</head>


<body  style="background-image: url('images/bg-01.jpg'); background-repeat: no-repeat; background-size: cover;">

<div style=" background-color: lightblue; font-size:1.5em; padding-left: 10px; margin: 10px 0 0 10px;  text-align: left; width: 200px; border-radius: 10px;">
<i style='font-size:18px' class='fas'>&#xf2bd;</i>
<%=session.getAttribute("sname")%>
</div>
<%@ page import="db.*"%>
<%@page import="java.sql.*,java.io.*" %>
	
<%

 try {
	
	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();

int serial=1;


String sql1="select count(a) from que";
ResultSet rc=st.executeQuery(sql1);
rc.next();
int count=	rc.getInt(1);
//out.print(count);

		String sql2="select * from qc";
		ResultSet rb=st.executeQuery(sql2);
		while(rb.next())
		{
		serial=rb.getInt("count");
		}
		
		if(serial<=count){
		
			
		String sql="select * from que where serialno='"+serial+"'";

		ResultSet rs=st.executeQuery(sql);
		
		while(rs.next())
		{
			%>
			
		<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-55 p-r-55 p-t-65 p-b-54">
				<form class="login100-form validate-form">
					

					<form name='forma' method='post'>
					<h4 align="center"><span  class="label label-danger"><div id='timer' class="label label-danger" >Submit before :	<span id='demo'></span>
					</div></span></h4><br>

						<span class="login100-form-title p-b-49">
						Question:
						</span>
						<center><%=rs.getInt(1)%>.<%=rs.getString(2)%></br><br><br></center>
						
						<input type='radio' name='q' value='a'/><%=rs.getString(3)%> </br><br>
						<input type='radio' name='q' value='b'/><%=rs.getString(4)%></br><br>
						<input type='radio' name='q' value='c'/><%=rs.getString(5)%></br><br>
						<input type='radio' name='q' value='d'/><%=rs.getString(6)%></br><br><br>
							
							
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name='s' type='submit' formaction='Aall.jsp' value='Answer'>
								Answer
							</button>
						</div>
					</div>
					
					<hr>
					
					
							
					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name='p' type='submit' formaction='prev.jsp' value='<< Previous'>
								Previous
							</button>
						</div>
					</div>

					<br>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" name='n' type='submit' formaction='next.jsp' value='Next >>'>
								Next
							</button>
						</div>
					</div>
						</center>
					</form>			

						</a>
					</div>
				</form>
			</div>
		</div>
	</div>

	<div id="dropDownSelect1"></div>
	
<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
			<%
		}
	
	
	
	 }
	 
		 
	 

}
catch(Exception e)
{
System.out.print(e);
out.print(e);
}


%>
</body>
</html>