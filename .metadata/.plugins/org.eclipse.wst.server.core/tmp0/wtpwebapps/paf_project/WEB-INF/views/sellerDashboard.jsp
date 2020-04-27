<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/views/includes.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap.css"/>">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/custom.css"/>">	
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<script type="text/javascript"
	href="<c:url value="/resources/js/bootstrap.min.js"/>"></script>



<title>Seller Dashboard</title>
</head>
<body background="<c:url value="/resources/images/bg-masthead.jpg"/>">
	<div class="top-nav-bar">
		<div class="search-box">
			<a href="/paf_project/sellerDashboard"><img
				src="<c:url value="/resources/images/cart.jpg"/>" class="logo"></a>
			<a href="/paf_project/editSeller"><input type="button"
				value="My Profile"
				style="width: 200px; height: 40px; margin: 8px; border-radius: 5px; background-color: #007bff; border: none; color: white" /></a>
		</div>

		<div class="menu-bar">
			<ul>
				<li><a href="/paf_project/viewAllOrderSeller"><i
						class="fas fa-luggage-cart" style="margin-right: 5px;"></i>Manage
						Orders</a></li>
				<li><a href="/paf_project/viewAllProductSeller"><i
						class="fas fa-tasks" style="margin-right: 5px;"></i>Manage
						Products </a></li>
				<li><a href="/paf_project/sellerLogout"><i class="fas fa-key"
						style="margin-right: 5px;"></i>Logout</a></li>
			</ul>
		</div>
	</div>
	
	<div>
	<h5 style="margin:20px;"><b>You are logged in as <font color="green"><%=session.getAttribute("emailSeller").toString() %></font></b></h5>
		<h1 align="right" style="font-size:70px; margin-right:150px; margin-top:150px;"><b>Welcome to <br> Seller Dashboard</b></h1>
	</div>
</body>
</html>