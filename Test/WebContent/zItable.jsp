<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
      
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
   <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
    
    
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Table V01</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util99.css">
	<link rel="stylesheet" type="text/css" href="css/main99.css">
	<!-- ================================================================================================================= -->
		<link rel="stylesheet" type="text/css" href="css/util2.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">

</head>
<body>
	
<%@ page import="db.*"%>
<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	Connection conn = Provider.getOracleConnection();
	Statement st=conn.createStatement();
	String sql="select * from instr";
	ResultSet rs=st.executeQuery(sql);
	try{
		if(rs!=null)
		{
	%>
	
	
	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1" style="width:10%; text-align: center;">Sl no.</th>
								<th class="column2" style="width:75%; text-align: center;">Instruction</th>
								<th class="column3" style="width:15%; text-align: center;">Update/Delete</th>
							</tr>
						</thead>
						<%
			while(rs.next())
			{
			%>
						<tbody>
							<tr>
						<td style="text-align: center;">
						<%=i %>
					</td>
					<td style="text-align: center;">
			 			<%=rs.getString("instruction") %>
						
					</td>
					<td><a href="zIupdate.jsp?id=<%=rs.getString("instruction")%>" > - Update</a><br><a href="zIdelete.jsp?id=<%=rs.getString("instruction")%>" > - Delete</a></td>
				</tr>
						
				</div>
			</div>				
		</div>
	</div>
	
						<%
				i++;
			}
						
			i=1;

			%>
			</tbody>

			</table>
			<hr>
			<center>
			
			
			
			<div style="width: 50%" class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="button" name="Exit" style="white-space: normal;" value="Add Instruction" class="btn" onclick="window.location.href='AddInstr.html';">	
								Add Instruction
							</button>
						</div>
					</div>
					
					<br>
					
				<div style="width: 50%" class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.jsp';">
								Back
							</button>
						</div>
					</div>	
			
			
			
			<!-- <input type="button" name="Exit" style="white-space: normal;" value="Add Instruction" class="btn" onclick="window.location.href='AddInstr.html';"><br><br>
				<input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.jsp';"> -->
	</center>
			

						
			<%
		}
		
		

	}
	


	catch(Exception e)
	{

	}
	st.close();
	rs.close();
	conn.close();
	%>




	

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>

</body>
</html>