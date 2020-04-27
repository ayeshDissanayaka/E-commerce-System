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



<title>Seller Orders</title>
</head>
<body>
	<div class="top-nav-bar">
		<div class="search-box">
			<a href="/paf_project/"><img
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
	
	
	<div align="center"
		style="padding: 20px; margin: 50px; border: solid 2px;">

		<center>
			<div>
				<h1 style="font-size: 35px;">
					<b style="color: black">Manage
							Orders</b>
				</h1>
			</div>


			<form:form action="/paf_project/searchSellerOrder" method="POST">
				<table align="center">
					<tr>
						<td><input type="text" name="searchVal"
							style="border: solid 1px" /></td>
						<td><input type="submit" class="btn btn-primary"
							name="action" value="Search" style="margin-left:10px;" /></td>
						<td><a href="/paf_project/viewAllOrderSeller"><input
								type="button" value="View All" class="btn btn-primary" style="margin-left:10px;" /></a></td>
					</tr>

				</table>
			</form:form>
			<br>
			<table border="1" cellpadding="5px;" width="100%">

				<th style="color: #fff; background-color: #007bff;">Order ID</th>
				<th style="color: #fff; background-color: #007bff;">Product ID</th>
				<th style="color: #fff; background-color: #007bff;">Product Name</th>
				<th style="color: #fff; background-color: #007bff;">Quantity</th>
				<th style="color: #fff; background-color: #007bff;">Total</th>
				<th style="color: #fff; background-color: #007bff;">Order Date</th>
				<th style="color: #fff; background-color: #007bff;">Status</th>


				<c:forEach var="sellerOrder" items="${listSellerOrder}">
					<tr>

						<td>${sellerOrder.orderID}</td>
						<td>${sellerOrder.productID}</td>
						<td>${sellerOrder.prodName}</td>
						<td>${sellerOrder.qty}</td>
						<td>${sellerOrder.total}</td>
						<td>${sellerOrder.orderDate}</td>
						<td>${sellerOrder.status}</td>

						<td align="center"><a
							href="/paf_project/deleteSellerOrder?itemID=${sellerOrder.itemID}&command=active"><input
								type="submit" class="btn btn-primary"
								style="background-color: green; border: 0px;" name="active"
								value="Mark As Shipped" /></a></td>
						<td align="center"><a
							href="/paf_project/deleteSellerOrder?itemID=${sellerOrder.itemID}&command=inactive"><input
								type="submit" style="background-color: red; border: 0px;"
								name="del" class="btn btn-primary" value="Mark As not Shipped" /></a></td>

					</tr>
				</c:forEach>
			</table>

		</center>


	</div>
	
</body>
</html>