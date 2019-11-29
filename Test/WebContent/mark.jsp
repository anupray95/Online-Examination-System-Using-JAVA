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
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
<meta charset="ISO-8859-1">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<link rel="stylesheet" type="text/css" href="css/main99.css">
	
		<link rel="stylesheet" type="text/css" href="css/util2.css">
	<link rel="stylesheet" type="text/css" href="css/main2.css">
</head>
<body style="background-image: url('images/bg-01.jpg'); background-size: cover;">
		<div style=" background-color: lightblue; font-size:1.5em; padding-left: 10px; margin: 10px 0 0 10px;  text-align: left; width: 200px; border-radius: 10px;">
<i style='font-size:18px' class='fas'>&#xf2bd;</i>
<%=session.getAttribute("sname")%>
</div>
<%@ page import="db.*"%>
<%@page import="java.sql.*,java.io.*" %>
	<%
	try{
		Connection conn = Provider.getOracleConnection();
		Statement st=conn.createStatement();
		String sql1="select count(a) from que";
		ResultSet rc=st.executeQuery(sql1);
		rc.next();
		int count=  rc.getInt(1);
	
	
	
	%>
	
	<sql:setDataSource var="db" driver="oracle.jdbc.OracleDriver" url="jdbc:oracle:thin:@localhost:1521:xe" user="system" password="lit"/>
	
	<sql:query var="rs" dataSource="${db }">
		select * from counter	
	</sql:query>
	
	<div class="limiter">
	
		<div class="container-table100">
		
			<div class="wrap-table100">
				<div class="table100">
					<table>
						<thead>
							<tr class="table100-head">
								<th class="column1" style="text-align:center">Total Questions</th>
								<th class="column2" style="text-align:center">Questions Attempted</th>
								<th class="column3" style="text-align:center">Correct Answers</th>
								<th class="column4" style="text-align:center">Marks Obtained</th>
								
							</tr>
						</thead>
						<tbody>
							<c:forEach var="table" items="${rs.rows }">
								<tr>
									<td class="column2" style="text-align:center"><c:out value="<%= count %>"></c:out>    </td>
									<td class="column2" style="text-align:center"><c:out value="${table.attempt }"></c:out>    </td>
									<td class="column3" style="text-align:center"><c:out value="${table.correct }"></c:out></td>
									<td class="column4" style="text-align:center"><c:out value="${table.correct }"></c:out></td>
									
								</tr>
								</c:forEach>
						</tbody>
					</table>
				</div>
					
					<br><br>
					<CENTER>
					<div style="width: 25%"  class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn"   onclick="window.location.href='home.html'">
								EXIT
							</button>
						</div>
					</div>
									
					</CENTER>
					
			</div>
		</div>
	
	</div>
	

<%
	}
	catch(Exception e)
	{}
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