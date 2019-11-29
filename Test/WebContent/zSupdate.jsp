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
</head>
<body>


<%@ page import="db.*"%>

<%@ page import= "java.sql.*"%>
	<%! int i=1; %>
	<%! String s=null; %>
	<%
	

	 Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
	String sql="select * from stdnt";
	ResultSet rs=st.executeQuery(sql);
	s=request.getParameter("id");
	session.setAttribute("olduid", s);
	
	try{
		if(rs!=null)
		{
	%>
	
	
	<main>
		<center>

			
					
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
  					  <th>Password</th>
  					  <th>Update/Delete</th>
  					</tr>
  					</thead>
	<%
			while(rs.next())
			{
			%><%if(s.equals(rs.getString("userid"))){ %>	
			<tbody>
				<tr>
					<td>
						<form>
						<input type="hidden" name="serialno" value="<%= rs.getString("serialno")%>">
						<%=i %>
					</td>
					<td>
			 			<input type="text" name="userid" value="<%= rs.getString("userid")%>">
						
					</td>
					<td>
			 			<input type="text" name="name" value="<%= rs.getString("name")%>">
						
					</td>
					<td>
						<input type="text" name="password" value="<%= rs.getString("password")%>">
					</td>
					<td><input type="submit" value="Modify" formaction="zSupdate2.jsp"></form><br><a href="zSdelete.jsp?id=<%=rs.getString("userid")%>" > - Delete</a></td>
				</tr>
				
				</div>
			</div>				
		</div>
	</div>
			<%}else{ %>	
			<tbody>
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
					<td>
						<input type="password" name="password" value="<%= rs.getString("password")%>" readonly>
					</td>
					<td><a href="zSupdate.jsp?id=<%=rs.getString("userid")%>" > - UPDATE</a><br><a href="zSdelete.jsp?id=<%=rs.getString("userid")%>" > - Delete</a></td>
				</tr>
				
				</div>
			</div>				
		</div>
	</div><%} %>
			<%
				i++;
			}
			i=1;

			%>
				</tbody>
				</table>
				
				<input type="button" name="Exit" style="white-space: normal;" value="Add Student" class="btn" onclick="window.location.href='AddStudent.html';"></th>
				<input type="button" name="Exit"  value="Back" class="btn" onclick="window.location.href='AdminLogin2.jsp';">

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

				
			
		</center>
	</main>