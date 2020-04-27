<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/views/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="<c:url value="/resources/css/bootstrap.min.css"/>">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/dash.css"/>" />
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/customStylesheet.css"/>" />
<script src="/resources/js/bootstrap.min.js"></script>

<%
	if(session.getAttribute("emailAdmin") == null){
		response.sendRedirect("/paf_project/admin");
	}

%>

<title>Admin Dashboard</title>
</head>
<body background="<c:url value="/resources/images/back1.png"/>">

	<div class="back-rec" style="padding: 0px; margin: 30px;">
	
	 
     

	<div align="right">
		<form action="/paf_project/adminLogout" method="post">
    						 <input type="submit" value="Logout" class="sub_btn" style = "width: 100px; height : 30px; margin-top: 20px; margin-right:40px; border-color: black;">
		</form>
	</div>
	
		<center>
			<div>
				<h1 style="font-size: 35px;">
					<b style="color:white">Admin Dashboard</b>
				</h1>
			</div>
		</center>


	 				
	 	<table align="center" border="0" id="but_menu" width="auto"
			height="400px" cellpadding="0px" cellspacing="0px">
			<tr>
				<td colspan = "3">
					<a href="/paf_project/viewAllCustomer">
					    <button class="btn_dash"
							style="background-color: red">
							Customer Management <br>
							<i class="fa fa-address-card"
								style="color: white; font-size: 30px; margin-top: 10px;  border-radius:10px; font-weight:bold"></i>
						</button>
					</a>
				</td>
				
				<td><a href="/paf_project/viewAllSeller"><button class="btn_dash"
							style="background-color: orangered">
							Seller Management <br>
							<i class="fa fa-bolt"
								style="color: white; font-size: 30px; margin-top: 10px;  border-radius:10px; font-weight:bold"></i>
						</button></a>
				</td>
				
				<td><a href="/paf_project/viewAllCategory"><button class="btn_dash"
							style="background-color: orange">
							Category Management <br>
							<i class="fa fa-bullhorn"
								style="color: white; font-size: 30px; margin-top: 10px;  border-radius:10px; font-weight:bold"></i>
						</button></a>
				</td>
						
						
				
			</tr>

			<tr>
				<td colspan="3"><a href="viewAllPayment">
					<button
							class="btn_dash" style="background-color: #0080ff">
							Payment Management <br>
							<i class="fa fa-gamepad"
								style="color: white; font-size: 30px; margin-top: 10px;"></i>
					</button>
					</a>
				</td>
				
				<td>
					<a href="/paf_project/viewAllShipping">
						<button class="btn_dash"
							style="background-color: forestgreen">
							Shipping Management <br>
							<i class="fa fa-calendar-check-o"
								style="color: white; font-size: 30px; margin-top: 10px;"></i>
						</button>
					</a>
				</td>
				
				<td>
					<a href = "/paf_project/viewAllProduct">
						<button class="btn_dash" style="background-color: brown">
						Inventory Management <br>
						<i class="fa fa-calendar"
							style="color: white; font-size: 30px; margin-top: 10px;"></i>
						</button>
					</a>
				</td>
					
			</tr>

			<tr>
			
			</tr>

		</table>			

		

				

		<p align="center" style="font-size: 15px;">
			<b>COPYRIGHT &copy LEARNFEVER 2018 | All Rights Reserved</b>
		<p>
			<br>
	</div>


</body>
</html>