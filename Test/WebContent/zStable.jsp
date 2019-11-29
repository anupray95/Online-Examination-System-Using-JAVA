<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
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
	
		<link rel="stylesheet" type="text/css" href="css/util2.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">
</head>
<body background="images/bg-01.jpg">
<script>
	var GET = {};
	var query = window.location.search.substring(1).split("&");
	for (var i = 0, max = query.length; i < max; i++)
	{
	    if (query[i] === "") // check for trailing & with no param
	        continue;

	    var param = query[i].split("=");
	    GET[decodeURIComponent(param[0])] = decodeURIComponent(param[1] || "");
	}
	if(GET["id"] === "1")
		{
		alert("User ID already Exist ! Try different .");}
</script>

<%@ page import="db.*"%>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%

	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
	String sql="select * from stdnt";
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
  					  <th>Sl No.</th>
  					  <th>USER ID</th>
  					   <th>NAME</th>
  					  <th>Update/Delete</th>
  					</tr>
  					</thead>
	<%
			while(rs.next())
			{
			%>	<tbody>
				<tr>
					<td>
						<%=i %>
					</td>
					<td>
			 			<%=rs.getString("userid") %>
						
					</td>
					<td>
			 			<%=rs.getString("name") %>
						
					</td>
					<td><a href="zSupdate.jsp?id=<%=rs.getString("userid")%>" > - UPDATE</a><br><a href="zSdelete.jsp?id=<%=rs.getString("userid")%>" > - Delete</a></td>
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
				
				<div style="width: 25%" class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AddStudent.html';">
								Add Student
							</button>
						</div>
					</div>
					
					<br>
					
				<div style="width: 25%" class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.jsp';">
								Back
							</button>
						</div>
					</div>	
				
				
			<!--  	<input type="button" name="Exit" style="white-space: normal;" value="Add Student" class="btn" onclick="window.location.href='AddStudent.html';"></th>-->
			<!--  <input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.jsp';">  -->	
				</center>
			</section>
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

				
</body>
</html>			
		